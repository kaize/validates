require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/validates/email_regexp')

class EmailRegexpTest < Test::Unit::TestCase
  include EmailRegexp

  def test_valid
    valid_emails = [
      'user@example.com',
      'user.mail@example.com',
      'user@example-domain.com',
      'user@example-d-a.com',
      'user@example.domain.com',
      'user_mail@example.com',
      'user+mail@example.com',
      'user123@example.com',
      'user@example123.com',
      'user@example.domain',
      'UseR@example.com',
      'user-mail@example.com'
    ]

    valid_emails.each do |email|
      assert regexp_compare(email), "#{email} not valid"
    end
  end

  def test_invalid
    invalid_emails = [
      'example_email',
      'us`er@example.com',
      'use"r@example.com',
      'user@example_domain.com',
      'user@domain.12',
      'user@domain',
      'user@domain..com',
      'user@.domain.com',
      'user@-domain.com',
      'user@domain-.com',
      'user@domain.-a.com',
      'user@domain-com',
      'user mail@example.com',
      'us[er@example.com',
      'us\'er@example.com',
      'us\er@example.com'
    ]

    invalid_emails.each do |email|
      assert !regexp_compare(email), "#{email} valid"
    end
  end

end
