class Student < ApplicationRecord
    validates :name, presence: true
    belongs_to :teacher
    belongs_to :parent, dependent: :destroy
    has_many :course_student, dependent: :nullify
    has_many :courses, through: :course_student   
end
