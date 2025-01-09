class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.integer :max_quantity
      t.integer :price
      t.datetime :start_date
      t.datetime :end_date
      t.string :version
      t.boolean :active

      t.timestamps
    end
  end
end
