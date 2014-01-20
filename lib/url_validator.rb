class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless valid?(value)
      record.errors.add(attribute, :url, options.merge(value: value))
    end
  end

  private

  def valid?(url)
    (url =~ URI::regexp(%w(http https))) == 0
  end
end
