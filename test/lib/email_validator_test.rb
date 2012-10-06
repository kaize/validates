require 'test_helper'

class EmailValidatorTest < Test::Unit::TestCase
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
      'user-mail@example.com',
      'user@example',
      'u@example.com',
      '!#$%&`*+/=?^`{|}~@example.com',
      '123@example.com',
      'user@123.com',
      'user@255.255.255.255',
      'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@iana.org',
      'test@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.com',
      'user@dom--ain.com',
      'user@example.dom-ain',
      'a@a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v',
      'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghi',
      '"user"@domain.com',
      '""@domain.com',
      '"\a"@domain.com',
      '"\\""@domain.com',
      '"\\\\"@domain.com',
      '1234567890123456789012345678901234567890123456789012345678901234@iana.org',
      '"user\ mail"@domain.com',
      '"Joe.\\Blow"@domain.com',
      '"user@maik"@domain.com',
      'user/mail=test@domain.com',
      '$U12345@domain.com',
      '!def!xyz%abc@iana.org',
      '_user@domain.com',
      '~@iana.org',
      'user@[127.0.0.1]',
      'foobar@192.168.0.1',
      'test@xn--example.com'
    ]

    valid_emails.each do |email|
      assert EmailValidator.valid?(email), "#{email} not valid"
    end
  end

  def test_invalid
    invalid_emails = [
      '',
      'example_email',
      '@',
      'user@',
      '@domain',
      'use"r@example.com',
      'user@example_domain.com',
      'user@domain.12',
      'user@domain..com',
      'user@.domain.com',
      'user@-domain.com',
      'user@domain-.com',
      'user@domain.-a.com',
      'user mail@example.com',
      'us[er@example.com',
      'us\er@example.com',
      '.user@domain.com',
      'user.@domain.com',
      'user..mail@domain.com',
      'user_at-domain.com',
      'test\@example@domain.com',
      'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklmn@iana.org',
      'test@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm.com',
      'user@.domain.com',
      'user@domain.com.',
      'user@domain..com',
      '123456789012345678901234567890123456789012345678901234567890@12345678901234567890123456789012345678901234567890123456789.12345678901234567890123456789012345678901234567890123456789.12345678901234567890123456789012345678901234567890123456789.12345.iana.org',
      'a@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefg.hij',
      'a@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefg.hijk',
      '"""@domain.com',
      '"\"@domain.com',
      'user"@domain.com',
      '"user@domain.com',
      '"user"test@domain.com',
      'user"test"@domain.com',
      '"user""test"@domain.com',
      '"user"."test"@domain.com',
      'first.last@sub.do,com',
      'user\@domain.com',
      'x@x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456789.x23456',
      '()[]\;:,><@iana.org',
      'first(middle)last@iana.org'
    ]

    invalid_emails.each do |email|
      assert !EmailValidator.valid?(email), "email #{email} valid"
    end
  end

end
