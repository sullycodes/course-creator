class Course < ApplicationRecord
    validates :title, presence: true
    #validates :title, uniqueness: true
    belongs_to :teacher
    has_many :course_student, dependent: :nullify
    has_many :students, through: :course_student, dependent: :nullify


    scope :has_students, -> { joins(:course_student).group('id').having(Arel.sql("count(id > 0")) }

    #Find which courses have a certain student by ID
    scope :has_student, -> (id)  { 
        where(id: CourseStudent.having('student_id = ?', id).group(:student_id).select(:student_id))
     }

    scope :short_title, -> { where("LENGTH(title) < 8") }
    scope :short_title_and_teacher_id_is, ->(id) { short_title.where("teacher_id = ?", id) }

end
