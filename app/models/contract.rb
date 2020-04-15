class Contract < ApplicationRecord
    belongs_to :user
    belongs_to :driver
    has_many :drivers, through: :offers
end
