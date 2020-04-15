class Driver < ApplicationRecord
    has_many :offers
    has_many :users, through: :offers
end


