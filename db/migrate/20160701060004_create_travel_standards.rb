class CreateTravelStandards < ActiveRecord::Migration
  def change
    create_table :travel_standards do |t|
      t.string :route_type
      t.references :order, index: true, foreign_key: true
      t.references :courier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
