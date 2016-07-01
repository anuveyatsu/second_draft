class CreateCourierLegalDetails < ActiveRecord::Migration
  def change
    create_table :courier_legal_details do |t|
      t.string :c_legal_name
      t.string :c_legal_BIN
      t.string :c_legal_address
      t.string :c_legal_bank_name
      t.string :c_legal_bank_BIN
      t.string :c_legal_SWIFT
      t.string :c_legal_bank_account
      t.string :c_legal_CEO
      t.references :courier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
