class InnValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless valid?(value)
      record.errors.add(attribute, :inn, options.merge(value: value))
    end
  end

  private

  def valid?(inn)
    inn = inn.to_s.split(//).map(&:to_i)

    if inn.length == 10
      n10 = calc(P10, inn)
      return true if n10 == inn[9]
    end

    if inn.length == 12
      n11 = calc(P11, inn)
      n12 = calc(P12, inn)
      return true if n11 == inn[10] && n12 == inn[11]
    end

    false
  end

  def calc(p, inn)
    p.each_with_index.inject(0){ |s, p| s + p[0] * inn[p[1]] } % 11 % 10
  end

  P10 = [2, 4, 10, 3, 5, 9, 4, 6, 8]
  P11 = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
  P12 = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
end
