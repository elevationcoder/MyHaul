class AddDriverIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :driver_id, :integer
  end
end
