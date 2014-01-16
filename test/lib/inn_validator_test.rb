require 'test_helper'

class InnValidatorTest < Test::Unit::TestCase
  def test_valid
    valid_inns = %w(
      165300180570
      183501166447
      341800950695
      470313747100
      471900124013
      503102384852
      7706633181
      7715805253
      7714698320
      7830002293
      5036032527
    )

    Model.reset_callbacks(:validate)
    Model.validates :field, inn: true

    valid_inns.each do |inn|
      model = Model.new
      model.field = inn

      assert model.valid?, "#{inn} not valid"
    end
  end

  def test_invalid
    invalid_inns = %w(
      #ffff
      orange-duck
      eee
      xxx
      epics
    ) << nil << ""

    Model.reset_callbacks(:validate)
    Model.validates :field, inn: true

    invalid_inns.each do |inn|
      model = Model.new
      model.field = inn

      refute model.valid?, "#{inn} not valid"
    end
  end
end
