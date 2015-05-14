class PersistenceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    attribute_changes = record.changes[attribute.to_s]
    if attribute_changes.present? && attribute_changes[0].present?
      record.errors.add(attribute, :changed, options.merge(value: value))
    end
  end
end
