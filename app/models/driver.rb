class Driver < ApplicationRecord
    has_many :offers
    has_many :users, through: :offers
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :truck_type, presence: true, uniqueness: true 
    validates :truck_size, presence: true, uniqueness: true
end


