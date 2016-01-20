class TaskListsController < ApplicationController
  def new
    @task_list = TaskList.new()
  end

  def create
    current_user.task_lists.create(task_list_params)
    redirect_to tasks_path
  end

  def edit
    @task_list = TaskList.find(params[:id])
    unless @task_list.user == current_user
      flash[:red] = "That's not yours!"
      redirect_to tasks_path
    end
  end

  def update
    list = TaskList.new(task_list_params)
    if list.valid?
      TaskList.find(params[:id]).update(task_list_params)
      redirect_to tasks_path
    else
      flash[:red] = "Couldn't be done."
      list.errors.full_messages.each do |message|
        flash[:red] << message
      end
      redirect_to :back
    end
  end

  private

  def task_list_params
    params.require(:task_list).permit(:title, :description)
  end
end
