class HttpUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless self.class.valid_url?(value)
      record.errors.add(attribute, :url, options.merge(:value => value))
    end
  end 
  def self.valid_url?(value)
    uri = URI.parse value
    uri.kind_of? URI::HTTP
  rescue URI::InvalidURIError
    false
  end
end

