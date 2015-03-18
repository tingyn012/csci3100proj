class AddFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :student_id, :integer
    add_column :students, :contact, :string
    add_column :students, :intro, :text
  end
end
