class AddUserToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :sender, index: true
    add_reference :messages, :recipient, index: true
  end
end
