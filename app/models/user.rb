class User < ApplicationRecord
    has_secure_password
    has_many :timeslots
    has_many :posts
end
