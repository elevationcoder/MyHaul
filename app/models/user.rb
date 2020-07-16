class User < ApplicationRecord
    has_many :reviews
    has_many :offers
    has_many :drivers, through: :offers
    validates :password, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
    acts_as_messageable

    def name
        "User #{email}"
    end

    def mailboxer_email(object)
        nil
    end

end
