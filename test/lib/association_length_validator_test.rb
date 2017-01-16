# -*- coding: utf-8 -*-
require 'test_helper'

class AssociationLengthValidatorTest < Minitest::Test

  def test_valid
    model = AssociatedModel.new
    [:field, :field2, :field3].each do |field|
      model.send("#{field}=", [1,2,3].map { AssociatedModel.new })
    end

    model.max = 3

    assert model.valid?
  end

  def test_invalid
    model = AssociatedModel.new
    [:field, :field2, :field3].each do |field|
      model.send("#{field}=", [1,2,3,4].map { AssociatedModel.new })
    end

    model.max = 3

    refute model.valid?
  end
end
