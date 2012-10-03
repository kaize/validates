module EmailRegexp

  MAX_EMAIL_LENGTH = 254

  # Maximum domain length
  MAX_DOMAIN_LENGTH = 255
  MAX_DOMAIN_PART_LENGTH = 64

  # Maximum user length
  MAX_USER_LENGTH = 64

  # User allowed chars
  LOCAL_ALLOWED_CHARS = '(?:[a-z0-9A-Z\!\#\$\%\&\'\*\-\/\=\?\+\-\^\_\`\{\|\}\~]|(?<!(?:^|\.))\.(?!$))'


  # Validate email format
  # @params [String] email
  # @return [true,false,nil]
  def email_format_valid?(email)

    domain, local= email.reverse.split('@', 2)

    return if email.length > MAX_EMAIL_LENGTH

    return if domain.nil? or local.nil? or domain.empty? or local.empty?

    domain.reverse!
    local.reverse!

    return if domain.length > MAX_DOMAIN_LENGTH or local.length > MAX_USER_LENGTH

    return unless email_domain_syntax_valid?(domain) and email_local_syntax_valid?(local)

    true
  end

  # Validate emails domain syntax
  # @params [String] domain
  # @return [true, false]
  def email_domain_syntax_valid?(domain)
    parts = domain.downcase.gsub(/(?:^\[(.+)\]$)/,'\1').split('.', -1)

    return false unless parts.all? { |part| part =~ /^(?!\-)[[:alnum:]\-]+(?<!\-)$/ && part.length < MAX_DOMAIN_PART_LENGTH}

    return true if parts.length == 4 and parts.all? { |part| part =~ /\A[0-9]+\Z/ and part.to_i.between?(0, 255) }

    return false if parts[-1] =~ /^\d+$/

    true
  end

  # Validate emails locale syntax
  def email_local_syntax_valid?(local)
    return if not email_local_syntax_regexp =~ local
    true
  end

  # Return emails local part syntax regexp
  # @return [Regexp]
  def email_local_syntax_regexp
    Regexp.new("^(?:\"(?:[\\\\]?#{LOCAL_ALLOWED_CHARS}|\\\\[\"\\s\\\\]|[@])*\"|#{LOCAL_ALLOWED_CHARS}*)$")
  end

end
