class Offer < ApplicationRecord
    belongs_to :user
    belongs_to :driver
    belongs_to :contract
    has_many :drivers, through: :users
    has_many :users, through: :drivers
end
