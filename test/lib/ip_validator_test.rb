require 'test_helper'

class IpValidatorTest < ValidatorTest
  def test_valid
    valid_ips = %w(
      21.189.63.11
      192.168.0.1
      127.0.0.1
      FE80:0000:0000:0000:0202:B3FF:FE1E:8329
    )

    Model.validates :field, ip: true

    valid_ips.each do |ip|
      model = Model.new
      model.field = ip

      assert model.valid?, "#{ip} not valid"
    end
  end

  def test_invalid
    invalid_ips = %w(
      epic
      123.18.18
      127.0.0.
      127.0.0.1.0
    )

    Model.validates :field, ip: true

    invalid_ips.each do |ip|
      model = Model.new
      model.field = ip

      refute model.valid?, "#{ip} not valid"
    end
  end

end
