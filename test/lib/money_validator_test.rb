require 'test_helper'

class MoneyValidatorTest < ValidatorTest

  def test_valid
    valid_money_count = %w(
      100
      1000.00
      1456
      5
      9000.00
    )

    Model.validates :field, money: true

    valid_money_count.each do |money_count|
      model = Model.new
      model.field = money_count

      assert model.valid?, "#{money_count} not valid"
    end
  end

  def test_invalid
    invalid_money_cost = %w(
      orange-duck
      a11111
      11111a
      1234a5678
    ).push('', ' ', nil, {}, [])

    Model.validates :field, money: true

    invalid_money_cost.each do |money_cost|
      model = Model.new
      model.field = money_cost

      refute model.valid?, "#{money_cost} not valid"
    end
  end
end
