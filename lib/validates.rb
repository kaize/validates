require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/enumerable'
require 'active_model'

[:email, :association_length, :inn, :money, :slug, :url, :absolute_path, :uri_component].each do |name|
  autoload :"#{name.to_s.classify}Validator", "#{name}_validator"
end

module Validates
end
