class Driver < ApplicationRecord
    has_many :users_drivers
    has_many :users, through: :users_drivers
    belongs_to :user
end


# c = Driver.new
# c.name = "Ian"
# c.user_id = 1
# c.save