class CreateBuyerLegalDetails < ActiveRecord::Migration
  def change
    create_table :buyer_legal_details do |t|
      t.string :b_legal_name
      t.string :b_legal_BIN
      t.string :b_legal_address
      t.string :b_legal_bank_name
      t.string :b_legal_bank_BIN
      t.string :b_legal_SWIFT
      t.string :b_legal_bank_account
      t.string :b_legal_CEO
      t.references :buyer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
