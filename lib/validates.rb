require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/enumerable'
require 'active_model'

Dir[File.dirname(__FILE__) + '/validators/*.rb'].each { |file| require file }

module Validates
end
