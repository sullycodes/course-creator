class CreateConferences < ActiveRecord::Migration[6.0]
  def change
    create_table :conferences do |t|
      t.integer :parent_id
      t.integer :teacher_id
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
