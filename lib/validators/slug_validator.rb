class SlugValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^[\w-]+$/i
      record.errors.add(attribute, :slug, options.merge(:value => value))
    end
  end                  
end
