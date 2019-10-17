class CreateCourseStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :course_students do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :student, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
