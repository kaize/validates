class MoneyValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^\d+?(?:\.\d{0,2})?$/
      record.errors.add(attribute, :is_not_money, options.merge(value: value))
    end
  end
end
