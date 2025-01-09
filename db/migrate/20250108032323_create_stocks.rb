class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :purchase_price
      t.string :supplier

      t.timestamps
    end
  end
end
