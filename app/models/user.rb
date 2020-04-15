class User < ApplicationRecord
    has_many :offers
    has_many :contracts
    has_many :drivers, through: :contracts
    has_many :contracts, through: :offers
end
