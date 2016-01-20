class TaskListsController < ApplicationController
  def new
    @task_list = TaskList.new()
  end

  def create
    User.find(cookies.signed[:session]).task_lists.create(task_list_params)
    redirect_to tasks_path
  end

  private

  def task_list_params
    params.require(:task_list).permit(:title, :description)
  end
end
