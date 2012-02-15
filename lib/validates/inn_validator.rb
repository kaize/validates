class InnValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, inn)
    result = false
    p10 = [2, 4, 10, 3, 5, 9, 4, 6, 8]
    p11 = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
    p12 = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]

    if inn.length == 10
      n10 = calc(p10, inn)
      result = (n10 == inn[9].to_i)
    end

    if inn.length == 12
      n11 = calc(p11, inn)
      n12 = calc(p12, inn)
      result = (n11 == inn[10].to_i) && (n12 == inn[11].to_i)
    end

    unless result
      record.errors.add(attribute, :inn, options.merge(:value => inn))
    end
  end

  def calc(p, inn)
    p.to_enum(:each_with_index).inject(0){|sum, elem| sum + elem[0].to_f * inn[elem[1]].to_f}%11%10
  end
end
