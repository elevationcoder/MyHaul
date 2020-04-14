class User < ApplicationRecord
    has_many :users_drivers
    has_many :drivers, through: :users_drivers
end
