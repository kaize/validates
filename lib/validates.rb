require 'active_support/core_ext/string/inflections'
require 'active_model'

[:email, :association_length, :inn, :money, :slug, :url, :absolute_path].each do |name|
  autoload :"#{name.to_s.classify}Validator", "#{name}_validator"
end

module Validates
end
