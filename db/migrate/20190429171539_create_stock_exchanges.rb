class CreateStockExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_exchanges do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :quantity
      t.integer :stock_type
      t.integer :remaining_quantity
      t.integer :status

      t.timestamps
    end
  end
end
