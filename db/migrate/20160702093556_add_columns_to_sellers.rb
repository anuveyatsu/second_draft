class AddColumnsToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :seller_name, :string
    add_column :sellers, :seller_rep_name, :string
    add_column :sellers, :seller_address1, :string
    add_column :sellers, :seller_address2, :string
    add_column :sellers, :seller_address3, :string
    add_column :sellers, :seller_phone, :string
  end
end
