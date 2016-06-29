class AddCompanyToPickups < ActiveRecord::Migration
  def change
    add_column :pickups, :company, :string
  end
end
