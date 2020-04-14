class User < ApplicationRecord
    has_many :contracts
    has_many :drivers, through: :contracts
end
