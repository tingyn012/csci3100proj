class AddCourseToGroup < ActiveRecord::Migration
  def change
    add_reference :groups, :course, index: true
  end
end
