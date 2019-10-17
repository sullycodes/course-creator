class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.text :bio
      t.string :strengths
      t.string :weaknesses
      t.string :interests
      t.string :grades
      t.integer :teacher_id
      t.timestamps
    end
  end
end
