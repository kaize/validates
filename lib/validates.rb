[:email, :association_length, :inn, :money, :slug, :url].each do |name|
  autoload :"#{name.classify}Validator", "#{name}_validator"
end

require 'active_model' # why i need do it?

module Validates
end
