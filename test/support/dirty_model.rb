class DirtyModel
  include ActiveModel::Validations
  include ActiveModel::Dirty

  define_attribute_methods :field

  def field
    @field
  end

  def field=(value)
    unless value == @field
      field_will_change!
      changes_applied
      clear_changes_information
    end

    @field = value
  end
end
