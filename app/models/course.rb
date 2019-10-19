class Course < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    belongs_to :teacher
    has_many :course_student
    has_many :students, through: :course_student, dependent: :nullify
end
