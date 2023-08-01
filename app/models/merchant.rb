class Merchant < ApplicationRecord

  enum status: { disabled: 0, enabled: 1 }
  
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def favorite_customers_alt
    customers.top_5_customers_by_transaction(self.id)
  end
  
  def self.find_by_status(merchant_status)
    Merchant.where(status: merchant_status).order(updated_at: :desc)
  end

  def self.enabled_merchants
    where('status = 1')
  end

  def self.disabled_merchants
    where('status = 0')
  end

  def distinct_invoices
    invoices.distinct
  end

  def items_ready
    items.joins(:invoices)
    .select("items.*, 
      invoices.id AS invoice_id, 
      invoices.created_at AS created_at_time,
      TO_CHAR(invoices.created_at, 'FMDay, FMMonth FMDD, YYYY') AS invoice_created_at")
      # note: this formats the date with PostgresQL formatting. In the future, I think we should make a module that formats a date.
    .where.not("invoice_items.status = 2")
    .where.not("invoices.status = 2")
    .distinct
    .order("invoices.created_at")
  end
  
  def self.top_five_merchants_by_revenue 
    joins(:transactions)
    .where("transactions.result = ?", "success")
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .group("merchants.id")
    .order("total_revenue DESC")
    .limit(5)
  end

  def best_day
    invoices.joins(:transactions, :invoice_items)
            .where('transactions.result = ?', 'success')
            .group("invoices.id")
            .select("invoices.*, SUM(invoice_items.unit_price * invoice_items.quantity) As tot_revenue")
            .order("tot_revenue DESC, invoices.created_at DESC")
            .first
  end
end
