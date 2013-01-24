class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless self.class.valid_url?(value)
      record.errors.add(attribute, :url, options.merge(:value => value))
    end
  end 
  class << self
    def valid_url?(value)
      #value =~ /^(https?:\/\/)?([\w\.]+)\.([a-z]{2,6}\.?)(\/[\w\.]*)*\/?$/
      uri = URI.parse value
      uri.kind_of? URI::HTTP
      rescue URI::InvalidURIError
        false
    end
  end
end

