class Teacher < ApplicationRecord
    has_secure_password
    validates :password, presence: true
    validates :username, uniqueness: true
    has_many :students
    has_many :courses
end
