require 'bundler/setup'
Bundler.require

require 'minitest/autorun'

Dir[File.dirname(__FILE__) + '/support/*.rb'].each{ |file| require file }

class ValidatorTest < Minitest::Test

  def teardown
    Model.reset_callbacks(:validate)
  end

end
