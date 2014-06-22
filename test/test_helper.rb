require 'bundler/setup'
Bundler.require

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

Dir[File.dirname(__FILE__) + '/support/*.rb'].each{ |file| require file }

class ValidatorTest < Minitest::Test

  def teardown
    Model.reset_callbacks(:validate)
  end

end
