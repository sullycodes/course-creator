class Teacher < ApplicationRecord
    has_secure_password
    validates :password, presence: true
    validates :username, uniqueness: true
    has_many :students
    has_many :courses
    has_many :conferences
    has_many :parents, through: :conferences
    has_many :parents, through: :students
end
