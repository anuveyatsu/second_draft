class CreateStoreLegalDetails < ActiveRecord::Migration
  def change
    create_table :store_legal_details do |t|
      t.string :st_legal_name
      t.string :store_legal_BIN
      t.string :store_legal_address
      t.string :store_legal_bank_name
      t.string :store_legal_bank_BIN
      t.string :store_legal_SWIFT
      t.string :store_legal_bank_account
      t.string :store_legal_CEO
      t.references :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
