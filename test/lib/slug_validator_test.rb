require 'test_helper'

class SlugValidatorTest < ValidatorTest

  def test_valid
    valid_slugs = %w(
      home
      global-news
      global_news
      new-2014-year
    )

    Model.validates :field, slug: true

    valid_slugs.each do |slug|
      model = Model.new
      model.field = slug

      assert model.valid?, "#{slug} not valid"
    end
  end

  def test_invalid
    invalid_slugs = %w(
      home?
      hello,world
      new/page
      !all'stars
      hello?
    )

    Model.validates :field, slug: true

    invalid_slugs.each do |slug|
      model = Model.new
      model.field = slug

      refute model.valid?, "#{slug} not valid"
    end
  end
end
