class EmailValidator < ActiveModel::EachValidator
  include EmailRegexp

  def validate_each(record, attribute, value)
    unless regexp_compare(value)
      record.errors.add(attribute, :email, options.merge(:value => value))
    end
  end
end
