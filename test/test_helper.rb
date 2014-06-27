require 'bundler/setup'
Bundler.require

require 'minitest/autorun'

# reporters doesn't work with AS < 4 (see https://travis-ci.org/kaize/validates/jobs/28579079)
if defined?(ActiveSupport::VERSION) && ActiveSupport::VERSION::MAJOR >= 4
  require "minitest/reporters"
  Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]
end

Dir[File.dirname(__FILE__) + '/support/*.rb'].each{ |file| require file }

class ValidatorTest < Minitest::Test

  def teardown
    Model.reset_callbacks(:validate)
  end

end
