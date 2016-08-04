class CreatePickupLegalDetails < ActiveRecord::Migration
  def change
    create_table :pickup_legal_details do |t|
      t.string :pickup_legal_name
      t.string :pickup_legal_BIN
      t.string :pickup_legal_address
      t.string :pickup_legal_bank_name
      t.string :pickup_legal_bank_BIN
      t.string :pickup_legal_SWIFT
      t.string :pickup_legal_bank_account
      t.string :pickup_legal_CEO
      t.references :pickup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
