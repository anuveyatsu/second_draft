class RemovePickupColumn < ActiveRecord::Migration
  def change
  	remove_column :pickups, :first_name
  	remove_column :pickups, :last_name
  end
end
