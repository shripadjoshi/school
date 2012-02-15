class AddClassroomIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :classroom_id, :integer
  end
end
