class AddTeacherIdToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :teacher, index: true, foreign_key: true
  end
end
