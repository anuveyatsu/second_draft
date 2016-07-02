class AddBuyersToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :buyer_name, :string
    add_column :orders, :buyer_email, :string
    add_column :orders, :buyer_phone, :string
  end
end
