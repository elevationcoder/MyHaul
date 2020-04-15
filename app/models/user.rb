class User < ApplicationRecord
    has_many :contracts, foreign_key: :driver_id
    has_many :drivers, through: :contracts
    validates :contracts, presence: true, :allow_blank => true
end
