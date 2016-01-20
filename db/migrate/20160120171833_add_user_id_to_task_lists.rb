class AddUserIdToTaskLists < ActiveRecord::Migration
  def change
    add_reference :task_lists, :user, index: true, foreign_key: true
  end
end
