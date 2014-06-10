require 'test_helper'

class UrlValidatorTest < Test::Unit::TestCase
  def teardown
    Model.reset_callbacks(:validate)
  end

  def test_valid
    valid_urls = %w{
      http://vk.com
      http://www.mail.ru/secret
      http://github.com/
      http://odesk.com/query=ruby+rails
      http://192.168.0.1
      http://asiniy.ru
      https://google.com
      https://127.0.0.1
    }

    Model.validates :field, url: true

    valid_urls.each do |url|
      model = Model.new
      model.field = url
      assert model.valid?, "#{url} is not valid"
    end
  end

  def test_invalid
    invalid_urls = %w{
      htt://yandex.ru
      httpns
      zzzz-mail
      12345678
      /1https://vk.com
    }.push('', ' ', nil)

    Model.validates :field, url: true

    invalid_urls.each do |url|
      model = Model.new
      model.field = url
      refute model.valid?, "#{url} is not valid"
    end
  end
end
