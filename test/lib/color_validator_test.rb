require 'test_helper'

class ColorValidatorTest < ValidatorTest

  def test_valid
    valid_colors = %w(
      #fff
      red
      blueviolet
      #eeeeee
      #abc09a
      black
      #0cf
      #012345
      #6789ab
      #cdefff
      green
    )

    Model.validates :field, color: true

    valid_colors.each do |color|
      model = Model.new
      model.field = color

      assert model.valid?, "#{color} not valid"
    end
  end

  def test_invalid
    invalid_colors = %w(
      #ffff
      orange-duck
      eee
      xxx
      epics
    )

    Model.validates :field, color: true

    invalid_colors.each do |color|
      model = Model.new
      model.field = color

      refute model.valid?, "#{color} not valid"
    end
  end
end
