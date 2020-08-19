class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :book, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.integer :cost , default: 0
      t.timestamps
    end
  end
end
