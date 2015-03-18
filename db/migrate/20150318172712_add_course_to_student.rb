class AddCourseToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :course, index: true
  end
end
