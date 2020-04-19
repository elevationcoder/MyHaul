class User < ApplicationRecord
    has_many :reviews
    has_many :offers
    has_many :drivers, through: :offers
    validates :password, presence: true
    validates :email, presence: true
    has_secure_password
end
