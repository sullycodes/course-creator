class Student < ApplicationRecord
    belongs_to :teacher
    has_many :course_student
    has_many :courses, through: :course_student
end
