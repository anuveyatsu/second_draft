class AddPickupToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :pickup, index: true, foreign_key: true
  end
end
