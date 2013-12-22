require 'test_helper'

class BlankValidatorTest < Test::Unit::TestCase
  def test_valid
    valid_values = [nil, '  ', '', false, [], {}]

    Model.reset_callbacks(:validate)
    Model.validates :field, blank: true

    valid_values.each do |value|
      model = Model.new
      model.field = value

      assert model.valid?, "#{value} not valid"
    end
  end

  def test_invalid
    invalid_values = ['11', '1 1 1', 'eee', 'jj', ['zzz'], { key: 'value' }]

    Model.validates :field, blank: true

    invalid_values.each do |value|
      model = Model.new
      model.field = value

      refute model.valid?, "#{value} not valid"
    end
  end
end
