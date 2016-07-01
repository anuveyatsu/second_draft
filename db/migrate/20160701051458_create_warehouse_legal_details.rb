class CreateWarehouseLegalDetails < ActiveRecord::Migration
  def change
    create_table :warehouse_legal_details do |t|
      t.string :w_legal_name
      t.string :w_legal_BIN
      t.string :w_legal_address
      t.string :w_legal_bank_name
      t.string :w_legal_bank_BIN
      t.string :w_legal_SWIFT
      t.string :w_legal_bank_account
      t.string :w_legal_CEO
      t.references :warehouse, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
