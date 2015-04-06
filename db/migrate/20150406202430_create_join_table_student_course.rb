class CreateJoinTableStudentCourse < ActiveRecord::Migration
  def change
    remove_column :students, :course_id
    create_join_table :students, :courses, column_options: {null: true} do |t|
      t.index [:student_id, :course_id]
      t.index [:course_id, :student_id]
    end
  end
end
