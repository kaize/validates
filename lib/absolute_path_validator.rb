class AbsolutePathValidator < ActiveModel::EachValidator
  class << self
    def valid?(value)
      Pathname.new(value).absolute?
    end
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value)
      record.errors.add(attribute, :absolute_path, options.merge(:value => value))
    end
  end
end
