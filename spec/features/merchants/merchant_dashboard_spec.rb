require "rails_helper"

RSpec.describe "Merchant Dashboard Page", type: :feature do
  before :each do
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
    @merchant_2 = Merchant.create!(name: 'Rempel and Jones')
    @merchant_3 = Merchant.create!(name: 'Willms and Sons')

    @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
    @item_2 = @merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076)
    @item_3 = @merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
    @item_4 = @merchant_1.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)
    @item_5 = @merchant_1.items.create!(name: 'Expedita Aliquam', description: 'Voluptate aut labore qui illum tempore eius. Corrupti cum et rerum', unit_price: 68723)
    @item_6 = @merchant_1.items.create!(name: 'Provident At', description: 'Numquam officiis reprehenderit eum ratione neque tenetur', unit_price: 15925)
    @item_7 = @merchant_1.items.create!(name: 'Expedita Fuga', description: 'Fuga assumenda occaecati hic dolorem tenetur dolores nisi', unit_price: 31163)
    @item_8 = @merchant_1.items.create!(name: 'Est Consequuntur', description: 'Reprehenderit est officiis cupiditate quia eos', unit_price: 34355)
    @item_9 = @merchant_1.items.create!(name: 'Quo Magnam', description: 'Culpa deleniti adipisci voluptates aut. Sed eum quisquam nisi', unit_price: 22582)
    @item_10 = @merchant_1.items.create!(name: 'Quidem Suscipit', description: 'Reiciendis sed aperiam culpa animi laudantium', unit_price: 34018)

    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
    @customer_2 = Customer.create!(first_name: 'Cecelia', last_name: 'Osinski')
    @customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Toy')
    @customer_4 = Customer.create!(first_name: 'Leanna', last_name: 'Braun')
    @customer_5 = Customer.create!(first_name: 'Sylvester', last_name: 'Nader')
    @customer_6 = Customer.create!(first_name: 'Heber', last_name: 'Kuhn')
    @customer_7 = Customer.create!(first_name: 'Parker', last_name: 'Daugherty')
    @customer_8 = Customer.create!(first_name: 'Loyal', last_name: 'Considine')
    @customer_9 = Customer.create!(first_name: 'Dejon', last_name: 'Fadel')
    @customer_10 = Customer.create!(first_name: 'Ramona', last_name: 'Reynolds')

    @invoice_1 = @customer_1.invoices.create!(status: 'cancelled')
    InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
    @invoice_2 = @customer_1.invoices.create!(status: 'cancelled')
    InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'pending')
    InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')

    @invoice_3 = @customer_2.invoices.create!(status: 'completed', created_at: Time.new(2000))
    InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_3.id, quantity: 12, unit_price: 34873, status: 'packaged')
    @invoice_4 = @customer_2.invoices.create!(status: 'in progress', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_4.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')

    @invoice_5 = @customer_3.invoices.create!(status: 'cancelled')
    InvoiceItem.create!(invoice_id: @invoice_5.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_5.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
    @invoice_6 = @customer_3.invoices.create!(status: 'in progress')
    InvoiceItem.create!(invoice_id: @invoice_6.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_6.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    
    @invoice_7 = @customer_4.invoices.create!(status: 'in progress')
    InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    @invoice_8 = @customer_4.invoices.create!(status: 'cancelled')
    InvoiceItem.create!(invoice_id: @invoice_8.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_8.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    
    @invoice_9 = @customer_5.invoices.create!(status: 'completed')
    InvoiceItem.create!(invoice_id: @invoice_9.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    @invoice_10 = @customer_5.invoices.create!(status: 'completed')
    InvoiceItem.create!(invoice_id: @invoice_10.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    
    @invoice_11 = @customer_6.invoices.create!(status: 'in progress')
    InvoiceItem.create!(invoice_id: @invoice_11.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    @invoice_12 = @customer_6.invoices.create!(status: 'completed')
    InvoiceItem.create!(invoice_id: @invoice_12.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')


    #Customer 1 
    @transaction_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
    @transaction_2 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'failed')
    @transaction_3 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
    @transaction_4 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
    @transaction_5 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
    @transaction_6 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
    #Customer 1 - total successful transactions = 2

    #Customer 2
    @transaction_7 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'failed')
    @transaction_8 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')
    @transaction_9 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')
    @transaction_10 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_11 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_12 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
    #Customer 2 - total successful transactions = 5

    #Customer 3
    @transaction_13 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')
    @transaction_14 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')
    @transaction_15 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')

    @transaction_16 = @invoice_6.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'failed')
    @transaction_17 = @invoice_6.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'failed')
    @transaction_18 = @invoice_6.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'success')
    #Customer 3 - total successful transactions = 4
    #Customer 4
    @transaction_19 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'failed')
    @transaction_20 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'failed')
    @transaction_21 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'failed')

    @transaction_22 = @invoice_8.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'success')
    @transaction_23 = @invoice_8.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'failed')
    @transaction_24 = @invoice_8.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'failed')
    #Customer 4 - total successful transactions = 1
    #Customer 5
    @transaction_25 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'failed')
    @transaction_26 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'failed')
    @transaction_27 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'failed')

    @transaction_28 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_29 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_30 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    #Customer 5 - total successful transactions = 3
    #Customer 6
    @transaction_31 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_32 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_33 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')

    @transaction_34 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_35 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_36 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    #Customer 6 - total successful transactions = 6
  end

  # 1. Merchant Dashboard
  it "shows the merchant name" do
    visit merchant_dashboard_path(@merchant_1)

    within("div#merchant-header") do
      expect(page).to have_content(@merchant_1.name).once
    end
  end

  # 2. Merchant Dashboard Links
  it "has links to the merchant items index and the invoice items index" do 
    visit merchant_dashboard_path(@merchant_1)

    within("div#merchant-header") do
      expect(page).to have_link("My Items")
      expect(page).to have_link("My Invoices")
    end
  end

  # 3. Merchant Dashboard Statistics - Favorite Customers
  describe "favorite customers" do
    it "lists names of the 5 customers with the most success transactions" do
      visit merchant_dashboard_path(@merchant_1)

      within("div#favorite-customers") do
        expect(page).to have_content(@customer_6.full_name).once
        expect(page).to have_content(@customer_2.full_name).once
        expect(page).to have_content(@customer_3.full_name).once
        expect(page).to have_content(@customer_5.full_name).once
        expect(page).to have_content(@customer_1.full_name).once
        
        expect(page).to_not have_content(@customer_4.full_name)
        
        expect(@customer_6.full_name).to appear_before(@customer_2.full_name)
        expect(@customer_2.full_name).to appear_before(@customer_3.full_name)
        expect(@customer_3.full_name).to appear_before(@customer_5.full_name)
        expect(@customer_5.full_name).to appear_before(@customer_1.full_name)
      end
    end

    it "lists the number of successful transactions for the favorite customers" do
      visit merchant_dashboard_path(@merchant_1)

      within("div#favorite-customers") do
        expect(page).to have_content("- 6 purchases")
        expect(page).to have_content("- 5 purchases")
        expect(page).to have_content("- 4 purchases")
        expect(page).to have_content("- 3 purchases")
        expect(page).to have_content("- 2 purchases")
        expect(page).to_not have_content("- 1 purchases")
      end
    end
  end

  # 4. Merchant Dashboard Items Ready to Ship
  describe "Items Ready to Ship" do
    it "lists the names of all items that are ordered and not shipped from uncancelled invoices" do
      visit merchant_dashboard_path(@merchant_1)

      within("div#items_to_be_shipped") do
        expect(page).to have_content(@item_3.name, count: 1)
        expect(page).to have_content(@item_4.name, count: 1)

        expect(page).to_not have_content(@item_1.name)
        expect(page).to_not have_content(@item_2.name)
        expect(page).to_not have_content(@item_5.name)
        expect(page).to_not have_content(@item_6.name)
        expect(page).to_not have_content(@item_7.name)
        expect(page).to_not have_content(@item_8.name)
        expect(page).to_not have_content(@item_9.name)
        expect(page).to_not have_content(@item_10.name)
      end
    end

    it "shows the invoice id next to each item to be shipped" do
      visit merchant_dashboard_path(@merchant_1)

      within("div#items_to_be_shipped") do
        expect(page).to have_content(@invoice_3.id, count: 1)
        expect(page).to have_content(@invoice_4.id, count: 1)

        expect(page).to_not have_content(@invoice_1.id)
        expect(page).to_not have_content(@invoice_2.id)
      end
    end

    it "the invoice id links to a merchant's invoice show page" do
      visit merchant_dashboard_path(@merchant_1)

      # maybe add the direct path for more accurate testing? Maybe even the advanced route?
      within("div#items_to_be_shipped") do
        expect(page).to have_link("#{@invoice_3.id}", count: 1)
        expect(page).to have_link("#{@invoice_4.id}", count: 1)
      end
    end

    it "Has the invoice created at date formatted and orders by oldest invoice date" do
      visit merchant_dashboard_path(@merchant_1)

      within("div#items_to_be_shipped") do
        earlier = "#{@invoice_3.id}"
        later = "#{@invoice_4.id}"

        expect(page).to have_content("Saturday, January 1, 2000")
        expect(page).to have_content("Sunday, January 1, 2023")
        expect(earlier).to appear_before(later)
      end
    end
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
end
