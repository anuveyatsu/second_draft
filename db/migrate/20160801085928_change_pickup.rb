class ChangePickup < ActiveRecord::Migration
  def change

  	add_column :pickups, :pickup_business_type, :string
  	add_column :pickups, :pickup_city, :string
  	add_column :pickups, :pickup_country, :string
  	add_column :pickups, :pickup_address, :string
  	add_column :pickups, :pickup_phone, :string
  	add_column :pickups, :pickup_working_hours, :string
  end
end
