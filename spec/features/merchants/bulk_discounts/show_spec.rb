require "rails_helper"

RSpec.describe "Merchant Invoices Show page", type: :feature do
  before :each do
    @merchant_1 = Merchant.create!(name: 'Ivys Plants', status: :disabled)
    @merchant_2 = Merchant.create!(name: 'Coles Computers', status: :disabled)
    @merchant_3 = Merchant.create!(name: 'Spooky Scarfs', status: :disabled)

    @discount_1 = @merchant_1.bulk_discounts.create!(percentage: 30, quantity: 10)
    @discount_2 = @merchant_1.bulk_discounts.create!(percentage: 20, quantity: 5)
    @discount_3 = @merchant_1.bulk_discounts.create!(percentage: 50, quantity: 15)

    @discount_4 = @merchant_2.bulk_discounts.create!(percentage: 14, quantity: 4)
    @discount_5 = @merchant_2.bulk_discounts.create!(percentage: 25, quantity: 8)
    @discount_6 = @merchant_2.bulk_discounts.create!(percentage: 32, quantity: 11)

    @discount_7 = @merchant_3.bulk_discounts.create!(percentage: 25, quantity: 10)
  end

  describe "As a Merchant when I visit the bulk discount show page" do
    it "has the bulk discount's quantity threshold and percentage discount" do
      visit merchant_bulk_discount_path(@merchant_1, @discount_3)

      expect(page).to have_content(@discount_3.quantity)
      expect(page).to have_content(@discount_3.percentage)
      expect(page).to_not have_content(@discount_1.quantity)
      expect(page).to_not have_content(@discount_1.percentage)
      expect(page).to have_content("#{@discount_3.percentage}% discount, when purchasing #{@discount_3.quantity} items")
    end

    it "has a link to edit the discount, when clicked it takes me to a form that have the currents discounts attributes already filled in" do
      visit merchant_bulk_discount_path(@merchant_1, @discount_3)

      expect(page).to have_link("Edit Discount")

      click_link("Edit Discount")

      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant_1, @discount_3))
save_and_open_page
      expect(page).to have_field("Percentage")
      expect(page).to have_field("Quantity")

      expect(page).to have_content("50%")
      expect(page).to have_content("15")
    end
  end
end