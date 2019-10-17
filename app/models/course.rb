class Course < ApplicationRecord
    belongs_to :teacher
    has_many :course_student
    has_many :students, through: :course_student  
end
