class DropTableWarehouse < ActiveRecord::Migration
  def change
  	drop_table :warehouses
  	drop_table :warehouse_legal_details
  end
end
