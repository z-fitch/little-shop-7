def admin_merchant_test
  @merchant_1 = Merchant.create!(name: "Bob's Burgers", status: :disabled)
  @merchant_2 = Merchant.create!(name: "Kwik-E-Mart", status: :enabled)
  @merchant_3 = Merchant.create!(name: "Strickland Propane", status: :disabled)
end

def original_test_data 
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde', status: :disabled)
    @merchant_2 = Merchant.create!(name: 'Rempel and Jones', status: :enabled)
    @merchant_3 = Merchant.create!(name: 'Willms and Sons', status: :disabled)

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

    @invoice_1 = @customer_1.invoices.create!(status: 'cancelled', created_at: Time.new(2000))
    InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
    @invoice_2 = @customer_1.invoices.create!(status: 'cancelled')
    InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'pending')
    InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')

    @invoice_3 = @customer_2.invoices.create!(status: 'completed', created_at: Time.new(2000))
    InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_3.id, quantity: 12, unit_price: 34873, status: 'packaged')
    @invoice_4 = @customer_2.invoices.create!(status: 'in progress', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_4.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')

    @invoice_5 = @customer_3.invoices.create!(status: 'cancelled', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_5.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_5.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
    @invoice_6 = @customer_3.invoices.create!(status: 'in progress', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_6.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_6.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    
    @invoice_7 = @customer_4.invoices.create!(status: 'in progress', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    @invoice_8 = @customer_4.invoices.create!(status: 'cancelled', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_8.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_8.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    
    @invoice_9 = @customer_5.invoices.create!(status: 'completed', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_9.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    @invoice_10 = @customer_5.invoices.create!(status: 'completed', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_10.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    
    @invoice_11 = @customer_6.invoices.create!(status: 'in progress', created_at: Time.new(2023))
    InvoiceItem.create!(invoice_id: @invoice_11.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    @invoice_12 = @customer_6.invoices.create!(status: 'completed', created_at: Time.new(2023))
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

def top_merchant_test_data 
  #All merchants enabled
@merchant_1 = Merchant.create!(name:"Dastardly Dan's", status: "enabled")
@merchant_2 = Merchant.create!(name:"Bob's Burgers", status: "enabled")
@merchant_3 = Merchant.create!(name:"Duck Diver's", status: "enabled")
@merchant_4 = Merchant.create!(name:'Schroeder-Jerde', status: "enabled")
@merchant_5 = Merchant.create!(name:'Rempel and Jones', status: "enabled")
@merchant_6 = Merchant.create!(name:'Willms and Sons', status: "enabled")

@customer_1 = Customer.create!(first_name: "John", last_name: "Smith")
@customer_2 = Customer.create!(first_name: "Jane", last_name: "Doe")
@customer_3 = Customer.create!(first_name: "John", last_name: "Doe")

#item numbers correspond to merchant number
@item_1 = Item.create!(name: "Items", unit_price: 1000, merchant_id: @merchant_1.id, description: "This is a description")
@item_2 = Item.create!(name: "Items", unit_price: 1000, merchant_id: @merchant_2.id, description: "This is a description")
@item_3 = Item.create!(name: "Items", unit_price: 1000, merchant_id: @merchant_3.id, description: "This is a description")
@item_4 = Item.create!(name: "Items", unit_price: 1000, merchant_id: @merchant_4.id, description: "This is a description")
@item_5 = Item.create!(name: "Items", unit_price: 1000, merchant_id: @merchant_5.id, description: "This is a description")
@item_6 = Item.create!(name: "Items", unit_price: 1000, merchant_id: @merchant_6.id, description: "This is a description")

@invoice_1 = Invoice.create!(status: "completed", customer_id: @customer_1.id)
@invoice_2 = Invoice.create!(status: "completed", customer_id: @customer_2.id)
@invoice_3 = Invoice.create!(status: "completed", customer_id: @customer_3.id)

#invoice_item numbers correspond to item numbers, repeat from 1 at invoice_item 7
#invoice_item_1 - 3 matches invoice_1, invoice_item_4 - 6 matches invoice_2, invoice_item_7 - 12 matches invoice_3
#Quantity varies, unit_price is 1000

@invoice_item_1 = InvoiceItem.create!(item: @item_1, invoice: @invoice_1, quantity: 100, unit_price: 1000)
@invoice_item_2 = InvoiceItem.create!(item: @item_2, invoice: @invoice_1, quantity: 90, unit_price: 1000)
@invoice_item_3 = InvoiceItem.create!(item: @item_3, invoice: @invoice_1, quantity: 40, unit_price: 1000)

@invoice_item_4 = InvoiceItem.create!(item: @item_4, invoice: @invoice_2, quantity: 90, unit_price: 1000)
@invoice_item_5 = InvoiceItem.create!(item: @item_5, invoice: @invoice_2, quantity: 50, unit_price: 1000)
@invoice_item_6 = InvoiceItem.create!(item: @item_6, invoice: @invoice_2, quantity: 90, unit_price: 1000)

@invoice_item_7 = InvoiceItem.create!(item: @item_1, invoice: @invoice_3, quantity: 90, unit_price: 1000)
@invoice_item_8 = InvoiceItem.create!(item: @item_2, invoice: @invoice_3, quantity: 20, unit_price: 1000)
@invoice_item_9 = InvoiceItem.create!(item: @item_3, invoice: @invoice_3, quantity: 10, unit_price: 1000)
@invoice_item_10 = InvoiceItem.create!(item: @item_4, invoice: @invoice_3, quantity: 5, unit_price: 1000)
@invoice_item_11 = InvoiceItem.create!(item: @item_5, invoice: @invoice_3, quantity: 30, unit_price: 1000)
@invoice_item_12 = InvoiceItem.create!(item: @item_6, invoice: @invoice_3, quantity: 70, unit_price: 1000)

#transaction numbers correspond to invoice numbers
@transaction_1 = Transaction.create!(invoice: @invoice_1, result: "success")
@transaction_2 = Transaction.create!(invoice: @invoice_2, result: "success")
@transaction_3 = Transaction.create!(invoice: @invoice_3, result: "success")
end

def invoice_spec_test_data
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
  @invoice_2 = @customer_1.invoices.create!(status: 'in progress', created_at: Time.new(2023))

  @invoice_3 = @customer_2.invoices.create!(status: 'in progress')
  @invoice_4 = @customer_2.invoices.create!(status: 'in progress', created_at: Time.new(2022))

  @invoice_5 = @customer_3.invoices.create!(status: 'cancelled')
  @invoice_6 = @customer_3.invoices.create!(status: 'in progress', created_at: Time.new(2020))

  @invoice_7 = @customer_4.invoices.create!(status: 'in progress')
  @invoice_8 = @customer_4.invoices.create!(status: 'cancelled')

  @invoice_9 = @customer_5.invoices.create!(status: 'completed')
  @invoice_10 = @customer_5.invoices.create!(status: 'completed')

  @invoice_11 = @customer_6.invoices.create!(status: 'in progress')
  @invoice_12 = @customer_6.invoices.create!(status: 'completed')

  @invoice_item1 = InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'packaged')
  @invoice_item2 = InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'packaged')
  @invoice_item3 = InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_2.id, quantity: 12, unit_price: 34873, status: 'pending')
  @invoice_item4 = InvoiceItem.create!(invoice_id: @invoice_4.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')
  @invoice_item5 = InvoiceItem.create!(invoice_id: @invoice_5.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
  @invoice_item6 = InvoiceItem.create!(invoice_id: @invoice_6.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  @invoice_item7 = InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
  @invoice_item8 = InvoiceItem.create!(invoice_id: @invoice_8.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')
end

def merchant_invoice_test_data
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
  @invoice_1 = @customer_1.invoices.create!(status: 'in progress', created_at: Time.new(2000))
  @invoice1_item_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'packaged')
  @invoice1_item_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 10, unit_price: 66747, status: 'shipped')
  
  # @invoice_2 has one item from @merchant_1 and one item from @merchant_2
  @invoice_2 = @customer_2.invoices.create!(status: 'completed', created_at: Time.new(2001))
  @invoice2_item_3 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_3.id, quantity: 9, unit_price: 23324, status: 'pending')
  @invoice2_item_4 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_4.id, quantity: 9, unit_price: 76941, status: 'packaged')

  # @invoice 3 has one item from @merchant_2
  @invoice_3 = @customer_3.invoices.create!(status: 'cancelled', created_at: Time.new(2003))
  @invoice3_item_4 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_4.id, quantity: 12, unit_price: 34873, status: 'packaged')
end

def item_data 
  @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde', status: :disabled)

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

  @invoice_1 = @customer_1.invoices.create!(status: 'cancelled', created_at: Time.new(2000))
  InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'packaged')
  InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
  @invoice_2 = @customer_1.invoices.create!(status: 'cancelled')
  InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'pending')
  InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')

  @invoice_3 = @customer_2.invoices.create!(status: 'completed', created_at: Time.new(2000))
  InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_3.id, quantity: 12, unit_price: 34873, status: 'packaged')
  @invoice_4 = @customer_2.invoices.create!(status: 'in progress', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_4.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')

  @invoice_5 = @customer_3.invoices.create!(status: 'cancelled', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_5.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
  InvoiceItem.create!(invoice_id: @invoice_5.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
  @invoice_6 = @customer_3.invoices.create!(status: 'in progress', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_6.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  InvoiceItem.create!(invoice_id: @invoice_6.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  
  @invoice_7 = @customer_4.invoices.create!(status: 'in progress', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  InvoiceItem.create!(invoice_id: @invoice_7.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  @invoice_8 = @customer_4.invoices.create!(status: 'cancelled', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_8.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  InvoiceItem.create!(invoice_id: @invoice_8.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  
  @invoice_9 = @customer_5.invoices.create!(status: 'completed', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_9.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  @invoice_10 = @customer_5.invoices.create!(status: 'completed', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_10.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  
  @invoice_11 = @customer_6.invoices.create!(status: 'in progress', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_11.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  @invoice_12 = @customer_6.invoices.create!(status: 'completed', created_at: Time.new(2023))
  InvoiceItem.create!(invoice_id: @invoice_12.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')

  #Customer 1 
  @transaction_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
  @transaction_2 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'failed')
  @transaction_4 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
  @transaction_5 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
  @transaction_6 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
  #Customer 1 - total successful transactions = 2

  #Customer 2
  @transaction_7 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'failed')
  @transaction_8 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')
  @transaction_10 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
  #Customer 2 - total successful transactions = 5

  #Customer 3
  @transaction_13 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')

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
  @transaction_29 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'failed')
  @transaction_30 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'failed')
  #Customer 5 - total successful transactions = 3
  #Customer 6
  @transaction_31 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
  @transaction_32 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'failed')
  @transaction_33 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'failed')

  @transaction_34 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
  @transaction_35 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'failed')
  @transaction_36 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'failed')
  #Customer 6 - total successful transactions = 6
end

def discount_data
  #Customer 1 
  @transaction_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
  @transaction_6 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'success')
  #Customer 2
  @transaction_8 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')
  @transaction_10 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
  #Customer 3
  @transaction_13 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')
  @transaction_18 = @invoice_6.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'success')
  #Customer 4
  @transaction_19 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'success')
  @transaction_22 = @invoice_8.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'success')
  #Customer 5
  @transaction_25 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'success')
  @transaction_28 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
  #Customer 6
  @transaction_31 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
  @transaction_34 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
end




require 'simplecov'
SimpleCov.start
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
