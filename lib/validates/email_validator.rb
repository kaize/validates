class EmailValidator < ActiveModel::EachValidator
  include EmailRegexp

  def validate_each(record, attribute, value)
    unless email_format_valid?(value)
      record.errors.add(attribute, :email, options.merge(:value => value))
    end
  end
end
