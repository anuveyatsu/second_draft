class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :seller_name
      t.string :seller_rep_name
      t.string :seller_address1
      t.string :seller_address2
      t.string :seller_address3
      t.string :seller_phone
      t.string :seller_email

      t.timestamps null: false
    end
  end
end
