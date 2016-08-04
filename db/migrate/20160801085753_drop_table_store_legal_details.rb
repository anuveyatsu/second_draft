class DropTableStoreLegalDetails < ActiveRecord::Migration
  def change
  	drop_table :store_legal_details
  end
end
