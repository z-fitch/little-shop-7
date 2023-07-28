require "rails_helper"

RSpec.describe "Admin Merchant Page", type: :feature do
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
  end
end
