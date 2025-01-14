require 'rails_helper'

RSpec.describe "Admin Merchant Show Page", type: :feature do 
  before :each do
    @merchant_1 = Merchant.create!(name: "Bob's Burgers", status: :enabled)
    @merchant_2 = Merchant.create!(name: "Kwik-E-Mart", status: :enabled)
    @merchant_3 = Merchant.create!(name: "Strickland Propane", status: :disabled)
  end
  

  describe "When I visit the merchant index (/admin/merchants)" do
    # US 24
    it "I see a list of all the merchants" do
      visit admin_merchants_path
      expect(Merchant.all.count).to eq(3) # sanity check

      Merchant.all.each do |merchant|
        expect(page).to have_content(merchant.name)
      end
      
      expect(page).not_to have_link("The Android's Dungeon & Baseball Card Shop")
    end
  # US 25
    it "I can click on a merchant name and be taken to the merchant show page" do

      visit admin_merchants_path
    
      click_link("Bob's Burgers")
      expect(current_path).to eq(admin_merchant_path(@merchant_1))
    end
  end

  describe "When I visit the merchant show page (/admin/merchants/:merchant_id)" do
    it "I see a link to update the merchant's information" do
    
      visit admin_merchant_path(@merchant_1)
      
      expect(page).to have_link('Update Merchant Information')
      expect(page).to have_content("Bob's Burgers")
      expect(page).not_to have_content("Kwik-E-Mart")

      click_link 'Update Merchant Information'
      expect(current_path).to eq(edit_admin_merchant_path(@merchant_1))
    
      fill_in "merchant[name]", with: "Robert's Hamburgers"
      click_button "Update Merchant"

      expect(page).to have_current_path(admin_merchant_path(@merchant_1))
      expect(current_path).to eq(admin_merchant_path(@merchant_1))
      expect(page).to have_content("Robert's Hamburgers")
      expect(page).to have_content('Merchant information updated successfully.')
    end
  end
  
  describe "sad path" do
    it "There is a form when you put nothing in the name box it give you an error saying it cant be blank" do
      visit edit_admin_merchant_path(@merchant_1)

      fill_in "merchant[name]", with: ""
      click_button "Update Merchant"
      
      expect(current_path).to eq(edit_admin_merchant_path(@merchant_1))
      expect(page).to have_content("Name can't be blank")
    end
  end
end
