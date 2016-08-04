class RemoveOrderColumn < ActiveRecord::Migration
  def change
  	remove_column :orders, :parcel_size_L
  	remove_column :orders, :parcel_size_W
  	remove_column :orders, :parcel_size_H
  end
end
