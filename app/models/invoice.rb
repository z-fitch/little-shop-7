class Invoice < ApplicationRecord
  enum :status, { "in progress" => 0, "completed" => 1, "cancelled" => 2 }
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates :status, presence: true

  def self.incomplete_invoices
    joins(:invoice_items).where.not(invoice_items: {status: 2}).order(created_at: :desc)
  end

  def formatted_date
    created_at.strftime("%A, %B %-e, %Y")
  end
  
  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def total_revenue_to_currency
    ActiveSupport::NumberHelper::number_to_currency(total_revenue.to_f / 100)
  end

  def self.status_list_for_select_menu
    statuses.keys.map { |status| [status.titleize, status]}
  end
end
