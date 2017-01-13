require 'test_helper'

class EanValidatorTest < ValidatorTest
  def test_valid
    valid_eans = %w{
      4600051000057
      4606066072461
      4011100977624
      4011100091108
      5000159413824
      4607065000073
      4607065001445
      4606800033277
      4620003010262
      4620003010101
      4620003010194
      4620003010095
      4607023900018
      4600395021176
      4630010881199
      4630010881205
      4004764816415
      4002390023542
      8001094212104
      8001094222110
      4690432004682
      5901234123457
      773602403936
      46009333
      96385074
      01234565
      11123453
      90101908
    }

    Model.validates :field, ean: true

    valid_eans.each do |ean|
      model = Model.new
      model.field = ean

      assert model.valid?, "#{ean} not valid"
    end
  end

  def test_invalid
    invalid_eans = %w{
      4606066072466
      4011100977623
      4011100091100
      5000159413828
      4607065000071
      4607065001446
      4606800033279
      46009330
      96385071
      01234564
      11123456
      90101907
    }.push('', ' ', nil)

    Model.validates :field, ean: true

    invalid_eans.each do |ean|
      model = Model.new
      model.field = ean

      refute model.valid?, "#{ean} not valid"
    end
  end
end
