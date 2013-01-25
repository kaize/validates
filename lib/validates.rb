require 'active_support/core_ext/string/inflections'
require 'active_model'

[:email, :association_length, :inn, :money, :slug, :http_url].each do |name|
  autoload :"#{name.to_s.classify}Validator", "#{name}_validator"
end

module Validates
end
