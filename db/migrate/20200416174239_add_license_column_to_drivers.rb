class AddLicenseColumnToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :license, :string
  end
end
