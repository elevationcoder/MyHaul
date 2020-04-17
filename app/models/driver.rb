class Driver < ApplicationRecord
    has_many :offers
    has_many :users, through: :offers
    has_secure_password
    validates :email, presence: true, uniqueness: true
    
end


