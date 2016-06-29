class AddFirstNameToPickups < ActiveRecord::Migration
  def change
    add_column :pickups, :first_name, :string
  end
end
