class CreateReplenishmentHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :replenishment_histories do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :purchase_price
      t.string :supplier

      t.timestamps
    end
  end
end
