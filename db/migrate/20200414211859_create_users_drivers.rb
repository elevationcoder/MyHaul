class CreateUsersDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_drivers do |t|
      t.integer :user_id
      t.integer :driver_id

      t.timestamps
    end
  end
end
