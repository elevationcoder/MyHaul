class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :job_name
      t.decimal :price_offer
      t.datetime :due_date
      t.belongs_to :user
      t.belongs_to :driver

      t.timestamps
    end
  end
end
