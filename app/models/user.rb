class User < ApplicationRecord
    
    validates :password, presence: true
    has_secure_password
    has_many :offers
    has_many :drivers, through: :offers
end
