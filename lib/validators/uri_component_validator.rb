class UriComponentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ URI::DEFAULT_PARSER.regexp[component]
      record.errors.add(attribute, :uri_component, options.merge(:value => value))
    end
  end

  def check_validity!
    valid_components = URI::DEFAULT_PARSER.regexp.keys

    if valid_components.exclude? component
      raise ArgumentError, "Component must be of the following type: #{valid_components}"
    end
  end

  def component
    options[:component]
  end
end
