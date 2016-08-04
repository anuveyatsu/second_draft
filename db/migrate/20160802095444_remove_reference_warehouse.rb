class RemoveReferenceWarehouse < ActiveRecord::Migration
  def change
  	remove_column :orders, :warehouse_id
  end
end
