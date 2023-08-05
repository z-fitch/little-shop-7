require 'rails_helper'

RSpec.describe Merchant, type: :model do 

  describe "relationships" do
    it {should have_many :items}
    it {should have_many(:invoice_items).through(:items)}
    it {should have_many(:invoices).through(:items)}
    it {should have_many(:customers).through(:invoices)}
    it {should have_many(:transactions).through(:invoices)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
  end
  
  describe "class methods" do
    it ".find_by_status" do
      original_test_data

      enabled_merchants = Merchant.find_by_status('enabled')
      expect(enabled_merchants.to_a).to eq([@merchant_2])

      disabled_merchants = Merchant.find_by_status('disabled')
      expect(disabled_merchants.to_a).to eq([@merchant_3, @merchant_1])
    end

    it ".top_five_merchants_by_revenue" do
      top_merchant_test_data

      expect(Merchant.top_five_merchants_by_revenue).to eq([@merchant_1, @merchant_6, @merchant_2, @merchant_4, @merchant_5])
      expect(Merchant.top_five_merchants_by_revenue).to_not eq([@merchant_3, @merchant_6, @merchant_2, @merchant_4, @merchant_5])
    end

    it ".enabled_merchants" do 
      original_test_data

      expect(Merchant.enabled_merchants).to eq([@merchant_2])
    end

    it ".disabled_merchants" do 
      original_test_data

      expect(Merchant.disabled_merchants).to eq([@merchant_1, @merchant_3])
    end
  end

  describe "instance methods" do 
    describe "#favorite_customers" do
      it "returns the top 5 customers with the most successful transactions for a merchant " do
        original_test_data

        expect(@merchant_1.favorite_customers_alt.first.num_transactions).to eq(6)
        expect(@merchant_1.favorite_customers_alt.first).to eq(@customer_6)
      end
    end

    describe "#distinct_invoices" do
      it "returns all invoices featuring an item from the merchant with no duplicates" do
        original_test_data

        merch_1_distinct_invoices = [@invoice_1, @invoice_2, @invoice_3, @invoice_4, @invoice_5, @invoice_6, @invoice_7, @invoice_8, @invoice_9, @invoice_10, @invoice_11, @invoice_12]

        expect(@merchant_1.distinct_invoices).to match_array(merch_1_distinct_invoices)
      end
    end
    
    describe "#items_ready" do
      it "returns all items that have been ordered, not shipped, and from an uncancelled invoice" do
        original_test_data

        expected_items = [@item_3, @item_4]
        result = @merchant_1.items_ready

        expect(result).to match_array(expected_items)
      end

      it "also returns the invoice_id for each associated item" do
        original_test_data

        result = @merchant_1.items_ready
        expect(result[0].invoice_id).to eq(@invoice_3.id)
        expect(result[1].invoice_id).to eq(@invoice_4.id)
      end

      it "sorts by invoice creation date, oldest first" do
        original_test_data

        result = @merchant_1.items_ready
        
        expect(result.first.created_at_time < result.last.created_at_time).to be true
      end

      it "returns a formatted string of the invoice creation date" do
        original_test_data

        result = @merchant_1.items_ready

        expect(result[0].invoice_created_at).to eq("Saturday, January 1, 2000")
        expect(result[1].invoice_created_at).to eq("Sunday, January 1, 2023")
      end
    end

    it "#best_day" do
      top_merchant_test_data

      expect(@merchant_1.best_day.formatted_date).to eq(@invoice_1.created_at.strftime("%A, %B %-e, %Y"))
      expect(@merchant_6.best_day.formatted_date).to eq(@invoice_2.created_at.strftime("%A, %B %-e, %Y"))
      expect(@merchant_2.best_day.formatted_date).to eq(@invoice_1.created_at.strftime("%A, %B %-e, %Y"))
      expect(@merchant_4.best_day.formatted_date).to eq(@invoice_2.created_at.strftime("%A, %B %-e, %Y"))
      expect(@merchant_5.best_day.formatted_date).to eq(@invoice_2.created_at.strftime("%A, %B %-e, %Y"))
    end
  end
end
