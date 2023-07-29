class Merchant < ApplicationRecord
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_customers_alt
    customers.top_5_customers_by_transaction(self.id)
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
  
end
