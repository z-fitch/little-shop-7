require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do 
  describe 'relationships' do 
    it { should belong_to :item }
    it { should belong_to :invoice }
    it { should have_many(:bulk_discounts).through(:item) }
  end

  before :each do
    @customer = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
    @merchant = Merchant.create!(name: 'Schroeder-Jerde')
    @item = @merchant.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
    @invoice = @customer.invoices.create!(status: 'in progress', created_at: Time.new(2000))
    @invoice_item = InvoiceItem.create!(invoice_id: @invoice.id, item_id: @item.id, quantity: 5, unit_price: 13635, status: 'packaged')

  end

  describe "instance methods" do
    describe "#dollar_price" do
      it "converts the unit price (cents) into dollars" do
        expect(@invoice_item.dollar_price).to eq(136.35)
      end
    end
    describe "#price_to_currency" do
      it "returns a price in currency format" do
        customer = Customer.create!(first_name: "Teddy", last_name: "Handyman")
        merchant = Merchant.create!(name: "Bob's Burgers")
        item = Item.create!(name: "Burger", description: "Delicious", unit_price: 1000, merchant_id: merchant.id)
        invoice = Invoice.create!(customer: customer, status: 1)
        invoice_item = InvoiceItem.create!(item_id: item.id, invoice_id: invoice.id, quantity: 10, unit_price: 1000, status: 1)

        expect(invoice_item.price_to_currency).to eq("$10.00")
      end
    end

    describe "#applied_discounts" do
      before :each do
        @merchant_1 = Merchant.create!(name: 'Hair Care')
        @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant_1.id, status: 1)
        @item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: @merchant_1.id)
        @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
        @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")
        @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 10, unit_price: 10, status: 2)
        @ii_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_8.id, quantity: 1, unit_price: 10, status: 1)
        @ii_3 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_8.id, quantity: 16, unit_price: 10, status: 1)


        @discount_1 = @merchant_1.bulk_discounts.create!(percentage: 30, quantity: 10)
        @discount_2 = @merchant_1.bulk_discounts.create!(percentage: 20, quantity: 8)
        @discount_3 = @merchant_1.bulk_discounts.create!(percentage: 50, quantity: 15)
      end

      it "returns a string for total revenue to currency" do
        expect(@ii_1.applied_discounts).to eq(@discount_1)
        expect(@ii_2.applied_discounts).to eq(nil)
        expect(@ii_3.applied_discounts).to eq(@discount_3)
      end
    end
  end
end
