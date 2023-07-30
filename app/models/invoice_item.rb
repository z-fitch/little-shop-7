class InvoiceItem < ApplicationRecord 
  enum :status, { pending: 0, packaged: 1, shipped: 2 }
  belongs_to :item
  belongs_to :invoice

  def price_to_currency
    ActiveSupport::NumberHelper::number_to_currency(unit_price.to_f / 100)
  end
end
