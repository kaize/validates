require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/enumerable'
require 'active_model'

[:absolute_path, :association_length, :blank, :color, :email, :inn, :money, :slug, :uri_component, :url].each do |name|
  autoload :"#{name.to_s.classify}Validator", "#{name}_validator"
end

module Validates
end
