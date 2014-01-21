require 'bundler/setup'
require 'minitest/autorun'
Bundler.require
Dir[File.dirname(__FILE__) + '/support/*.rb'].each{ |file| require file }
