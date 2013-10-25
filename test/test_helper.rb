require 'bundler/setup'
Bundler.require
Dir[File.dirname(__FILE__) + '/support/*.rb'].each{ |file| require file }
