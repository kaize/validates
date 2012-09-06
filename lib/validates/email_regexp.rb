module EmailRegexp
  def regexp_compare(value)
    value =~ /\A[-.\w+]+@([a-z\d][-a-z\d]+\.?[a-z\d]+)+\.[a-z]{2,}\z/i
  end

end

