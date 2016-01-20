class AddTaskListIdToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :task_list, index: true, foreign_key: true
  end
end
