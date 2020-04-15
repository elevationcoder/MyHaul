class Driver < ApplicationRecord
    has_many :contracts
    has_many :users, through: :contracts
    belongs_to :user
end


