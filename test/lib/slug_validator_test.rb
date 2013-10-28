require 'test_helper'

class SlugValigatorTest < Test::Unit::TestCase
  def test_valid
    valid_slugs = [
      'page',
      'hello_world'
    ]

    valid_slugs.each do |slug|
      assert SlugValidator.valid?(slug), "slug #{slug} not valid!"
    end
  end

  def test_invalid
    invalid_slugs = [
      '123_page',
      '',
      '!!!!slug',
      too_big_slug
    ]

    invalid_slugs.each do |slug|
      assert !SlugValidator.valid?(slug), "slug #{slug} valid!"
    end
  end

  private
    def too_big_slug
      chars = [('a'..'z'), ('A'..'Z')].map { |r| r.to_a }.flatten
      chars << '_'
      too_big_value = SlugValidator::MAX_SLUG_LENGTH + 1

      (0...too_big_value).map{ chars[rand(chars.length)] }.join
    end
end
