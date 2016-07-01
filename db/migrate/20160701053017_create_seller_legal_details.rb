class CreateSellerLegalDetails < ActiveRecord::Migration
  def change
    create_table :seller_legal_details do |t|
      t.string :s_legal_name
      t.string :s_legal_BIN
      t.string :s_legal_address
      t.string :s_legal_bank_name
      t.string :s_legal_bank_BIN
      t.string :s_legal_SWIFT
      t.string :s_legal_bank_account
      t.string :s_legal_CEO
      t.references :seller, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
