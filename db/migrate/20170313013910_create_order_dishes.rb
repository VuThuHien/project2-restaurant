class CreateOrderDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :order_dishes do |t|
      t.references :order, foreign_key: true
      t.references :dish, foreign_key: true
      t.integer :discount
      t.integer :quantity
      t.integer :price
      t.integer :total_price
      t.timestamps
    end
  end
end
