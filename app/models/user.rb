class User < ApplicationRecord
    has_secure_password 
    has_many :recipes
    validates :username, presence: true, uniqueness: true
    validate :check_password

    private 
    def check_password
    password == password_confirmation
    end
end
