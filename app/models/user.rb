class User < ApplicationRecord
    has_many :offers
    has_many :drivers, through: :offers
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
