class CreateTravelPremia < ActiveRecord::Migration
  def change
    create_table :travel_premia do |t|
      t.references :order, index: true, foreign_key: true
      t.references :courier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
