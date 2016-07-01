class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :warehouse_name
      t.string :warehouse_location
      t.string :warehouse_manager
      t.string :warehouse_phone
      t.string :warehouse_email

      t.timestamps null: false
    end
  end
end
