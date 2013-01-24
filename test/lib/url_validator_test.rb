require 'test_helper'

class UrlValidatorTest < Test::Unit::TestCase
 
  def test_valid
    valid_urls = [
      'http://kaize.ru',
      'http://kaize.ru',
      'http://kaize.github.com/',
      'http://kaize.ru/pages/contact',
      'http://kaize.github.com/pages/javascript.html',
      'http://kaize/'
    ]
    valid_urls.each do |url|
      assert UrlValidator.valid_url?(url)
    end
  end

  def test_invalid
    invalid_urls = [
      'http://kaize.ru empty',
      ' ht tp :empty//kaize.ru',
      'ht tp::empty/ /kaize.ru empty',
      'ht tp:empty//kaize.ru empty',
      'h ttp://kaize.ru',
      'http://kaize.ru 123',
      'http:empty//kaize.ru empty',
      'http :empty//kaize.ru',
      'empty http:empty/ /kaize.ru empty',
      'emptyhttp://kaize.ru' 
    ]

    invalid_urls.each do |url|
      assert !UrlValidator.valid_url?(url)
    end
  end

end
