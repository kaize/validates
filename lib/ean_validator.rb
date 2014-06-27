class EanValidator < ActiveModel::EachValidator
  # http://en.wikipedia.org/wiki/International_Article_Number_(EAN)
  # EAN-8 & EAN-13 validator

  def validate_each(record, attribute, value)
    unless valid?(value)
      record.errors.add(attribute, :ean, options.merge(value: value))
    end
  end

  private

  def valid?(ean)
    return false if ean.blank?
    return false unless ean =~ /^\d+$/
    return false unless [8, 13].include?(ean.length)
    return false unless calc_check_digit(ean)

    true
  end

  def calc_check_digit(ean)
    coefficient_table = (ean.length == 8) ? EAN_CHECK_DIGIT8 : EAN_CHECK_DIGIT13
    ean.split(//).each_with_index.inject(0){ |s, (v, i)| s + v.to_i * coefficient_table[i] } % 10 == 0
  end

  EAN_CHECK_DIGIT8 = [3, 1, 3, 1, 3, 1, 3, 1]
  EAN_CHECK_DIGIT13 = [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1]
  private_constant :EAN_CHECK_DIGIT8, :EAN_CHECK_DIGIT13
end
