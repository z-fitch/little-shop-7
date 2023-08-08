class CreateBulkDiscount < ActiveRecord::Migration[7.0]
  def change
    create_table :bulk_discounts do |t|
      t.integer :quantity
      t.integer :percentage

      t.timestamps
    end
  end
end
