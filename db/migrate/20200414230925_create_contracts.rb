class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.belongs_to :user
      t.belongs_to :driver

      t.timestamps
    end
  end
end
