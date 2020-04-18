class Driver < ApplicationRecord
    has_many :offers
    has_many :users, through: :offers
    has_many :reviews, through: :users
    has_secure_password
    validates :email, presence: true, uniqueness: true

    def self.search(search)
        if search
            driver = Driver.find_by(email: search)
            if driver
                self.where(id: driver)
            else
                @drivers = Driver.all
            end
        else
            @drivers = Driver.all
        end
    end
    
end


