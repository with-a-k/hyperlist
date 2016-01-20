class TasksController < ApplicationController
  before_action :any_user

  def index
    @user = User.includes(:task_lists).find(cookies.signed[:session])
  end

  def new
    @task = TaskList.find(params[:task_list_id]).tasks.new()
  end

  def create
    task = Task.create(task_params)
    if task.valid?
      task.save
      redirect_to tasks_path
    else
      flash[:red] = "Couldn't be done."
      task.errors.full_messages.each do |message|
        flash[:red] << message
      end
      redirect_to :back
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.new(task_params)
    if task.valid?
      Task.find(params[:id]).update(task_params)
      redirect_to tasks_path
    else
      flash[:red] = "Couldn't be done."
      task.errors.full_messages.each do |message|
        flash[:red] << message
      end
      redirect_to :back
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :notes, :start, :due, :task_list_id)
  end
end
