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

  # =========== User Story 4 ===========

  describe "As a Merchant when I visit the bulk discount show page" do
    it "has the bulk discount's quantity threshold and percentage discount" do
      visit merchant_bulk_discount_path(@merchant_1, @discount_3)

      expect(page).to have_content(@discount_3.quantity)
      expect(page).to have_content(@discount_3.percentage)
      expect(page).to_not have_content(@discount_1.quantity)
      expect(page).to_not have_content(@discount_1.percentage)
      expect(page).to have_content("#{@discount_3.percentage}% discount, when purchasing #{@discount_3.quantity} items")
    end
    # =========== End User Story 4 ===========

    # =========== User Story 5 ===========
    it "has a link to edit the discount, when clicked it takes me to a form that have the currents discounts attributes already filled in" do
      visit merchant_bulk_discount_path(@merchant_1, @discount_3)

      expect(page).to have_link("Edit Discount")

      click_link("Edit Discount")

      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant_1, @discount_3))

      expect(page).to have_field("Percentage", with: @discount_3.percentage)
      expect(page).to have_field("Quantity", with: @discount_3.quantity)
    end

    it "when the edit form is filled in with new information, after clicking submit i am redirected to the show page and the information shows up" do
      visit edit_merchant_bulk_discount_path(@merchant_1, @discount_3)

      fill_in("Quantity", with: "15")
      fill_in("Percentage", with: "15")
      click_button("Save")

      expect(current_path).to eq(merchant_bulk_discount_path(@merchant_1, @discount_3))

      expect(page).to have_content("15%")
      expect(page).to have_content("15 items")
    end

    # sad paths

    it "when the edit form is filled in with invaild information, after clicking submit i am redirected to the edit page with an error" do
      visit edit_merchant_bulk_discount_path(@merchant_1, @discount_3)

      fill_in("Quantity", with: "15")
      fill_in("Percentage", with: "")
      click_button("Save")

      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant_1, @discount_3))
      expect(page).to have_content("Error: Percentage is not a number")
    end

    it "when the edit form is filled in with invaild information, after clicking submit i am redirected to the edit page with an error" do
      visit edit_merchant_bulk_discount_path(@merchant_1, @discount_3)

      fill_in("Quantity", with: "")
      fill_in("Percentage", with: "15")
      click_button("Save")

      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant_1, @discount_3))
      expect(page).to have_content("Error: Quantity is not a number")
    end

    it "when the edit form is filled in with invaild information, after clicking submit i am redirected to the edit page with an error" do
      visit edit_merchant_bulk_discount_path(@merchant_1, @discount_3)

      fill_in("Quantity", with: "15")
      fill_in("Percentage", with: "Hello")
      click_button("Save")

      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant_1, @discount_3))
      expect(page).to have_content("Error: Percentage is not a number")
    end

    it "when the edit form is filled in with invaild information, after clicking submit i am redirected to the edit page with an error" do
      visit edit_merchant_bulk_discount_path(@merchant_1, @discount_3)

      fill_in("Quantity", with: "Hello")
      fill_in("Percentage", with: "15")
      click_button("Save")

      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant_1, @discount_3))
      expect(page).to have_content("Error: Quantity is not a number")
    end
  end
end

# =========== End User Story 5 ===========