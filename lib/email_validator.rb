class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless valid?(value)
      record.errors.add(attribute, :email, options.merge(value: value))
    end
  end

  MAX_EMAIL_LENGTH = 254
  MAX_DOMAIN_LENGTH = 255
  MAX_DOMAIN_PART_LENGTH = 64
  MAX_USER_LENGTH = 64
  LOCAL_ALLOWED_CHARS = '(?:[a-z0-9A-Z\!\#\$\%\&\'\*\-\/\=\?\+\-\^\_\`\{\|\}\~]|(?<!(?:^|\.))\.(?!$))'

  private_constant :MAX_EMAIL_LENGTH, :MAX_DOMAIN_LENGTH, :MAX_DOMAIN_PART_LENGTH, :MAX_USER_LENGTH, :LOCAL_ALLOWED_CHARS

  private

  def valid?(value)
    email_format_valid?(value.to_s)
  end

  def email_format_valid?(email)
    domain, local = email.reverse.split('@', 2)

    return false if domain.blank? || local.blank?
    return false if email.length > MAX_EMAIL_LENGTH
    return false if domain.length > MAX_DOMAIN_LENGTH || local.length > MAX_USER_LENGTH
    return false if !email_domain_syntax_valid?(domain) || !email_local_syntax_valid?(local)

    true
  end

  def email_domain_syntax_valid?(domain)
    parts = domain.reverse.downcase.gsub(/(?:^\[(.+)\]$)/,'\1').split('.', -1)

    return false if parts.size == 1 && options[:reject_one_level_domain]
    return false unless parts.all? { |part| part =~ /^(?!\-)[[:alnum:]\-]+(?<!\-)$/ && part.length < MAX_DOMAIN_PART_LENGTH }
    return true if parts.length == 4 && parts.all? { |part| part =~ /\A[0-9]+\Z/ && part.to_i.between?(0, 255) }
    return false if parts[-1] =~ /^\d+$/

    true
  end

  def email_local_syntax_valid?(local)
    email_local_syntax_regexp =~ local.reverse
  end

  def email_local_syntax_regexp
    Regexp.new("^(?:\"(?:[\\\\]?#{LOCAL_ALLOWED_CHARS}|\\\\[\"\\s\\\\]|[@])*\"|#{LOCAL_ALLOWED_CHARS}*)$")
  end
end
