class Invoice < ApplicationRecord
  enum :status, { "in progress" => 0, "completed" => 1, "cancelled" => 2 }
  belongs_to :customer
  has_many :transactions, dependent: :destroy 
  has_many :invoice_items, dependent: :destroy 
  has_many :items, through: :invoice_items
  has_many :bulk_discounts, through: :invoice_items

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
    #per note from Chris Simmons "That looks good to us; this Ruby isn’t doing anything that AR could do, so it can be used like this."
  end
  
  def merchant_invoice_items(merchant_id)
    invoice_items.joins(:item).where("items.merchant_id = #{merchant_id}")
  end
  
  def merchant_revenue(merchant_id)
    invoice_items
    .joins(:item)
    .where("items.merchant_id = #{merchant_id}")
    .sum("invoice_items.unit_price * quantity")
  end
  
  def revenue_discount
    invoice_items.joins(:bulk_discounts)
      .where("invoice_items.quantity >= bulk_discounts.quantity")
      .select("invoice_items.*, max((invoice_items.quantity * invoice_items.unit_price * bulk_discounts.percentage)/100) AS total_discount")
      .group("invoice_items.id")
      .sum(&:total_discount)
      #https://www.fastruby.io/blog/rails/performance/writing-fast-rails-part-2.html
      # for the ^ &
  end
  
  def discounted_revenue
    total_revenue - revenue_discount
  end

  def discounted_revenue_to_currency
    ActiveSupport::NumberHelper::number_to_currency(discounted_revenue.to_f / 100)
  end


  def merchant_revenue_to_currency(merchant_id)
    ActiveSupport::NumberHelper::number_to_currency(merchant_revenue(merchant_id).to_f / 100)
  end
end
