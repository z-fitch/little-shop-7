class Item < ApplicationRecord 
  enum :status, {disabled: 0, enabled: 1}
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy 
  has_many :invoices, through: :invoice_items
  has_many :bulk_discounts, through: :merchant

  validates :name, :description, presence: true
  validates_numericality_of :unit_price, presence: true

  def current_price
    price = (unit_price * 0.01).round(3)
    "$#{price}"
  end

  def self.enabled_items
    where(status: 1)
  end

  def self.disabled_items
    where(status: 0)
  end

  def self.top_5_items
    joins(invoices: :transactions)
      .where("transactions.result = ?", "success")
      .select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price)/100 AS invoice_item_revenue")
      .group(:id)
      .order("invoice_item_revenue DESC")
      .limit(5)
      .distinct
  end


  
  def top_item_day
    invoices.joins(:transactions)
      .where("transactions.result = ?", "success")
      .select("invoices.*, invoice_items.quantity AS items_sales")
      .group("invoices.id, invoices.created_at, items_sales")
      .order(items_sales: :desc).first
  end
end 