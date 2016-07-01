class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :store_description
      t.string :store_IDproject
      t.string :store_enabled
      t.string :store_IdUser

      t.timestamps null: false
    end
  end
end
