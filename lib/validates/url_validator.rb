class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ URI::regexp(%w(http https))
      record.errors.add(attribute, :url, options.merge(:value => value))
    end
  end                  
end
