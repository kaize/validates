[:email, :inn, :money, :slug, :url].each do |name|
  autoload :"#{name.capitalize}Validator", "#{name}_validator"
end

require 'active_model' # why i need do it?

module Validates
end
