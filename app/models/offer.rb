class Offer < ApplicationRecord
    belongs_to :user
    belongs_to :driver, optional: true
    scope :open, -> { where(driver_id: nil) }
    scope :contracted, -> { where(driver_id: !nil)}
    scope :above, ->(price) { where("price_offer > ?", price )}

    # scope :accepted_by, ->(driver) { }

    # def accepted_by(driver)
    #     self.
end
