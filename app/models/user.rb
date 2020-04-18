class User < ApplicationRecord
    has_many :reviews
    has_many :offers
    has_many :drivers, through: :offers
    Validates :password, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
