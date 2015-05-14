require 'test_helper'

class PersistenceValidatorTest < ValidatorTest

  def test_valid
    DirtyModel.validates :field, persistence: true
    model = DirtyModel.new
    model.field = '   '
    assert model.valid?

    model.field = 'fill it with value'
    assert model.valid?

    model.field = 'another unpredictable change'
    assert model.valid?
  end
end
