class Contract < ApplicationRecord
    belongs_to :user, class_name: "User"
    belongs_to :driver, class_name: "Post"
end
