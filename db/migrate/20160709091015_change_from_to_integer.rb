class ChangeFromToInteger < ActiveRecord::Migration
  def change
    change_column :orders, :from, :integer
  end
end
