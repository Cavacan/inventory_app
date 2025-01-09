class CreateEmailChangeRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :email_change_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :new_email
      t.boolean :approved

      t.timestamps
    end
  end
end
