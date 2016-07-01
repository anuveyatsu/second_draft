class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_date
      t.string :transaction_amount
      t.string :transaction_buyers_email
      t.references :seller, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
