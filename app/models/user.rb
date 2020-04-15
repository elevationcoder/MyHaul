class User < ApplicationRecord
    has_many :contracts
    has_many :drivers, through: :contracts
    validates :contracts, presence: true, :allow_blank => true
end
