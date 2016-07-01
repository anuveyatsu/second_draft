class CreateCouriers < ActiveRecord::Migration
  def change
    create_table :couriers do |t|
      t.string :courier_name
      t.string :courier_phone
      t.string :courier_email
      t.string :courier_vehicle_number
      t.string :courier_vehicle_model
      t.string :courier_vehicle_color
      t.string :courier_vehicle_capacity
      t.string :courier_vehicle_bearing

      t.timestamps null: false
    end
  end
end
