class Review < ApplicationRecord
  belongs_to :user
  belongs_to :driver
end
