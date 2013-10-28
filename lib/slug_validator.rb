class SlugValidator < ActiveModel::EachValidator
  MAX_SLUG_LENGTH = 250
  MIN_SLUG_LENGTH = 1

  def validate_each(record, attribute, value)
    unless self.class.valid?(value)
      record.errors.add(attribute, :slug, options.merge(:value => value))
    end
  end

  class << self

    def valid?(value)
      value.to_s =~ /^[a-zA-Z_]{#{MIN_SLUG_LENGTH},#{MAX_SLUG_LENGTH}}$/i
    end
  end
end
