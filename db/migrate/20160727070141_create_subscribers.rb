class CreateSubscribers < ActiveRecord::Migration
  def change
    #drop_table :subscribers
    create_table :subscribers do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
