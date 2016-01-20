class TaskListsController < ApplicationController
  before_action :any_user

  def new
    @task_list = TaskList.new()
  end

  def create
    list = current_user.task_lists.new(task_list_params)
    if list.valid?
      list.save
      redirect_to tasks_path
    else
      flash[:red] = "Couldn't be done."
      list.errors.full_messages.each do |message|
        flash[:red] << message
      end
      redirect_to :back
    end
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

  def destroy
    list = TaskList.find(params[:id])
    unless list.user == current_user
      flash[:red] = "That's not yours!"
      redirect_to tasks_path
    end
    list.destroy
    redirect_to tasks_path
  end

  private

  def task_list_params
    params.require(:task_list).permit(:title, :description)
  end
end
