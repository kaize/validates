#require 'active_record'
#require 'nulldb/rails'

#ActiveRecord::Base.establish_connection :adapter => :nulldb

class AssociatedModel# < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessor :field
  attr_accessor :field2
  attr_accessor :field3
  attr_accessor :max

  validates :field, association_length: { maximum: -> (record) { record.max } }
  validates :field2, association_length: { maximum: -> { 3 } }
  validates :field3, association_length: { maximum: :max }

  def marked_for_destruction?
    false
  end
end
