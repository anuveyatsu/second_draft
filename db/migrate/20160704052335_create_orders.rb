class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :from
      t.string :buyer_name
      t.string :buyer_phone
      t.string :buyer_email
      t.string :delivery_option
      t.string :transport_provider
      t.string :delivery_status, :default => "processing"
      t.string :parcel_size_L
      t.string :parcel_size_W
      t.string :parcel_size_H
      t.string :parcel_weight
      t.string :parcel_content
      t.references :seller, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.references :warehouse, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
