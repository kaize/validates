require 'test_helper'

class AbsolutePathValidatorTest < Minitest::Test
  def test_valid
    valid_path = '/some/path'

    assert AbsolutePathValidator.valid?(valid_path)
  end

  def test_invalid
    invalid_path = 'some/path'

    refute AbsolutePathValidator.valid?(invalid_path)
  end

end
