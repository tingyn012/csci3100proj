class CreateJoinTableStudentGroup < ActiveRecord::Migration
  def change
    create_join_table :students, :groups, column_options: {null: true} do |t|
      t.index [:student_id, :group_id]
      t.index [:group_id, :student_id]
    end
  end
end
