require 'test_helper'

class MoneyValidatorTest < Test::Unit::TestCase
  def teardown
    Model.reset_callbacks(:validate)
    Model.validates :field, money: true
  end

  def test_valid
    valid_money_count = %w(
      100
      1000.00
      1456
      5
      9000.00
    )

    valid_money_count.each do |money_count|
      model = Model.new
      model.field = money_count

      assert model.valid?, "#{money_count} not valid"
    end
  end

  def test_invalid
    invalid_money_cost = %w(
      100.0
      0.0
      orange-duck
      a11111
      11111a
      1234a5678
    ).push('', ' ', nil, {}, [])

    invalid_money_cost.each do |money_cost|
      model = Model.new
      model.field = money_cost

      refute model.valid?, "#{money_cost} not valid"
    end
  end
end
