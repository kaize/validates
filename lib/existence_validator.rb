class ExistenceValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    children = record.send attribute
    if children.all?(&:marked_for_destruction?)
      record.errors.add(attribute, :existence, options)
    end
  end

end
