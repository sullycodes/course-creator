class Student < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    belongs_to :teacher
    has_many :course_student
    has_many :courses, through: :course_student
end
