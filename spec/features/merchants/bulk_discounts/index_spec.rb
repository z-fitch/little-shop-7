require "rails_helper"

RSpec.describe "Merchant Invoices Index page", type: :feature do
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

  describe "When I visit the merchant dashboard" do 
    it "has a link to view all the discounts for that merchant" do 
      visit merchant_dashboard_path(@merchant_1)

      within("div#discounts") do 
        click_link("All Discounts")
        expect(current_path).to eq(merchant_bulk_discounts_path(@merchant_1))
      end
    end
  end

  describe "When I visit the bulk discount index page" do 
    it "shows all discounts for that merchant with their quantity threshold and percentage" do 
      visit merchant_bulk_discounts_path(@merchant_1)

      within("div#all-discounts") do 
        expect(page).to have_content(@discount_1.quantity)
        expect(page).to have_content(@discount_1.percentage)
        expect(page).to have_content(@discount_2.quantity)
        expect(page).to have_content(@discount_2.percentage)
        expect(page).to have_content(@discount_3.quantity)
        expect(page).to have_content(@discount_3.percentage)

        expect(page).to have_content("#{@discount_1.percentage}% off #{@discount_1.quantity} items")
        expect(page).to have_content("#{@discount_2.percentage}% off #{@discount_2.quantity} items")
        expect(page).to have_content("#{@discount_3.percentage}% off #{@discount_3.quantity} items")

        expect(page).to_not have_content(@discount_4.quantity)
        expect(page).to_not have_content(@discount_4.percentage)
        expect(page).to_not have_content(@discount_5.quantity)
        expect(page).to_not have_content(@discount_5.percentage)
        expect(page).to_not have_content(@discount_6.quantity)
        expect(page).to_not have_content(@discount_6.percentage)
      end
    end

    it "has a link to each discounts show page" do 
      visit merchant_bulk_discounts_path(@merchant_1)

      within("div#all-discounts") do 
        expect(page).to have_link("#{@discount_1.percentage}% off #{@discount_1.quantity} items")
        expect(page).to have_link("#{@discount_2.percentage}% off #{@discount_2.quantity} items")
        expect(page).to have_link("#{@discount_3.percentage}% off #{@discount_3.quantity} items")

        expect(page).to_not have_link("#{@discount_4.percentage}% off #{@discount_4.quantity} items")
        expect(page).to_not have_link("#{@discount_5.percentage}% off #{@discount_5.quantity} items")
        expect(page).to_not have_link("#{@discount_6.percentage}% off #{@discount_6.quantity} items")
        
        click_link("#{@discount_1.percentage}% off #{@discount_1.quantity} items")
      
        expect(current_path).to eq(merchant_bulk_discount_path(@merchant_1, @discount_1))
      end
    end

    it "has a link to create a new discount, when clicked it takes us to a form to create a discount" do
      visit merchant_bulk_discounts_path(@merchant_1)

      expect(page).to have_link("Create Discount")

      click_link("Create Discount")

      expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant_1))
    end

    it "has a form to fill in with valid data, after being filled, I click sumbit I am redirected to the  bulk discount index" do 
      visit new_merchant_bulk_discount_path(@merchant_1)

      expect(page).to have_content("New Bulk Discount")
      expect(page).to have_field("Quantity")
      expect(page).to have_field("Percentage")
      expect(page).to have_button("Save")

      fill_in("Quantity", with: "15")
      fill_in("Percentage", with: "45")

      click_button("Save")
      expect(current_path).to eq(merchant_bulk_discounts_path(@merchant_1))

      within("div#all-discounts") do 
        expect(page).to have_content("45% off 15 items")
      end
    end

    it "filled in with Invalid Percentage, after being filled, I click submit and i see an error saying the discount cant be made" do 
      visit new_merchant_bulk_discount_path(@merchant_1)

      fill_in("Quantity", with: "15")
      fill_in("Percentage", with: "")

      click_button("Save")

      expect(page).to have_content("Percentage is not a number")
    end

    it "filled in with Invalid Quantity, after being filled, I click submit and i see an error saying the discount cant be made" do 
      visit new_merchant_bulk_discount_path(@merchant_1)

      fill_in("Quantity", with: "")
      fill_in("Percentage", with: "20")

      click_button("Save")

      expect(page).to have_content("Quantity is not a number")
    end

    it "filled in with Invalid Percentage, after being filled, I click submit and i see an error saying the discount cant be made" do 
      visit new_merchant_bulk_discount_path(@merchant_1)

      fill_in("Quantity", with: "15")
      fill_in("Percentage", with: "Hello")

      click_button("Save")

      expect(page).to have_content("Percentage is not a number")
    end

    it "filled in with Invalid Quantity, after being filled, I click submit and i see an error saying the discount cant be made" do 
      visit new_merchant_bulk_discount_path(@merchant_1)

      fill_in("Quantity", with: "Hello")
      fill_in("Percentage", with: "20")

      click_button("Save")

      expect(page).to have_content("Quantity is not a number")
    end

    it "has a button to delete a discount" do 
      visit merchant_bulk_discounts_path(@merchant_1)

      within("div#all-discounts") do 
        expect(page).to have_button("Delete Discount", count: 3)
      end
    end

    it "has a button to delete and when clicked, i am redirect to the index page and it removes the discount from merchant" do 
      visit merchant_bulk_discounts_path(@merchant_3)

      within("div#all-discounts") do 
        merchant_bulk_discounts_path(@merchant_3)
        click_button("Delete Discount")
        expect(current_path).to eq(merchant_bulk_discounts_path(@merchant_3))
        expect(page).to_not have_content(@discount_7)
      end
    end
  end
end


