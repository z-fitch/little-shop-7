require "rails_helper"

RSpec.describe "Merchant Invoices Index page", type: :feature do
  before :each do
    # Customers
    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
    @customer_2 = Customer.create!(first_name: 'Cecelia', last_name: 'Osinski')
    @customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Toy')
    @customer_4 = Customer.create!(first_name: 'Leanna', last_name: 'Braun')

    # Merchants
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
    @merchant_2 = Merchant.create!(name: 'Rempel and Jones')

    # Items
    # @merchant_1's items
    @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
    @item_2 = @merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076)
    @item_3 = @merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
    # @merchant_2's item
    @item_4 = @merchant_2.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)

    # Invoices
    # @invoice_1 has two items from @merchant_1
    @invoice_1 = @customer_1.invoices.create!(status: 'in progress')
    InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 10, unit_price: 66747, status: 'shipped')
    
    # @invoice_2 has one item from @merchant_1 and one item from @merchant_2
    @invoice_2 = @customer_2.invoices.create!(status: 'cancelled')
    InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_3.id, quantity: 9, unit_price: 23324, status: 'pending')
    InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_4.id, quantity: 9, unit_price: 76941, status: 'packaged')

    # @invoice 3 has one item from @merchant_2
    @invoice_3 = @customer_3.invoices.create!(status: 'completed')
    InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_4.id, quantity: 12, unit_price: 34873, status: 'packaged')
  end

  describe "When I visit a merchant's invoices index (/merchants/:merchant_id/invoices)" do
    it "I see all of the invoices that include at least one of my merchant's items" do
      visit merchant_invoices_path(@merchant_1)

      within("div#merchant_invoices") do
        expect(page).to have_content("Invoice ##{@invoice_1.id}").once
        expect(page).to have_content("Invoice ##{@invoice_2.id}").once

        expect(page).to_not have_content("Invoice ##{@invoice_3.id}")
      end
      
      visit merchant_invoices_path(@merchant_2)

      within("div#merchant_invoices") do
        expect(page).to have_content("Invoice ##{@invoice_2.id}").once
        expect(page).to have_content("Invoice ##{@invoice_3.id}").once

        expect(page).to_not have_content("Invoice ##{@invoice_1.id}")
      end
    end

    it "each invoice.id links to its merchant invoice show page" do
      visit merchant_invoices_path(@merchant_1)
      save_and_open_page

      within("div#merchant_invoices") do
        expect(page).to have_link("#{@invoice_1.id}", href: merchant_invoice_path(@merchant_1, @invoice_1))
        expect(page).to have_link("#{@invoice_2.id}", href: merchant_invoice_path(@merchant_1, @invoice_2))
      end

      visit merchant_invoices_path(@merchant_2)

      within("div#merchant_invoices") do
        expect(page).to have_link("#{@invoice_2.id}", href: merchant_invoice_path(@merchant_2, @invoice_2))
        expect(page).to have_link("#{@invoice_3.id}", href: merchant_invoice_path(@merchant_2, @invoice_3))
      end
    end
  end
end
