class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :job_name
      t.decimal :price_offer
      t.belongs_to :user
      t.belongs_to :driver
      t.belongs_to :contract

      t.timestamps
    end
  end
end
