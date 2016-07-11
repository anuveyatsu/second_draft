class AddPincodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pincode, :integer
  end
end
