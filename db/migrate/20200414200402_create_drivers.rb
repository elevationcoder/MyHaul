class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :truck_type
      t.string :truck_size

      t.timestamps
    end
  end
end
