class AddUidToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :uid, :integer
  end
end
