require "rails_helper"

RSpec.describe "Admin Merchant Page", type: :feature do
  describe "When I visit the merchant index (/admin/merchants)" do
    # US 24
    it "I see the name of each merchant" do
      merchant_1 = Merchant.create!(name: "Merchant 1")
      visit admin_merchants_path

      expect(page).to have_content("Merchant 1")
    end
  end
end
