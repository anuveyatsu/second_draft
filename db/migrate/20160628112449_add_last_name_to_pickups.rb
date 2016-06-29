class AddLastNameToPickups < ActiveRecord::Migration
  def change
    add_column :pickups, :last_name, :string
  end
end
