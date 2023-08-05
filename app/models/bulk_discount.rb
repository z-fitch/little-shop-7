class BulkDiscount < ApplicationRecord
  belongs_to :merchant

  validates_numericality_of :quantity, presence: true
  validates_numericality_of :percentage, presence: true
end