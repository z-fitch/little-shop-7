require 'rails_helper'

RSpec.describe Item, type: :model do 
  describe "relationships" do
    it { should belong_to(:merchant)}
    it { should have_many(:invoice_items)}
    it { should have_many(:invoices).through(:invoice_items)}
    it { should have_many(:bulk_discounts).through(:merchant) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_numericality_of :unit_price }
  end

  describe "class methods" do
    describe ".enabled_items" do
      it "returns the unit price as $xx.xx " do
        merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
        item_1 = merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107, status: 1)
        item_2 = merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076, status: 1)
        item_3 = merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301, status: 0)

        expect(merchant_1.items.enabled_items.to_a).to eq([item_1, item_2])
      end
    end

    describe ".disabled_items" do
      it "returns the unit price as $xx.xx " do
        merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
        item_1 = merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107, status: 1)
        item_2 = merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076, status: 1)
        item_3 = merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301, status: 0)

        expect(merchant_1.items.disabled_items.to_a).to eq([item_3])
      end
    end

    describe ".top_5_items" do 
      it "returns the top 5 items by total revenue generated" do
        item_data
        
        expect(@merchant_1.items.top_5_items).to eq([@item_1, @item_7, @item_5, @item_3, @item_4])
      end
    end
  end
  
  describe "instance methods" do 
    describe "#current_price" do
      it "returns the unit price as $xx.xx " do
        merchant_3 = Merchant.create!(name: 'Willms and Sons')
        item_1 = merchant_3.items.create!(name: 'Gold Ring', description: 'A ring thats gold', unit_price: 75107)
        item_2 = merchant_3.items.create!(name: 'Silver ring', description: 'A ring thats silver', unit_price: 45107)
        expect(item_1.current_price).to eq("$751.07")
        expect(item_2.current_price).to eq("$451.07")
      end
    end

    describe "#top_item_day" do 
      it "returns the top day for a specific item" do
        original_test_data
  
        expect(@merchant_1.items.first.top_item_day.formatted_date).to eq("Sunday, January 1, 2023")
        expect(@merchant_1.items.third.top_item_day.formatted_date).to eq("Saturday, January 1, 2000")
      end
    end
  end
end