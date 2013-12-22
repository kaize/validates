class BlankValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :blank, options.merge(value: value)) unless value.blank?
  end
end
