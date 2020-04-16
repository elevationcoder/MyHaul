class AddPasswordColumnToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :password_digest, :string
  end
end
