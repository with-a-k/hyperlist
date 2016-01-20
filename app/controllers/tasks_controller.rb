class TasksController < ApplicationController
  def index
    @user = User.includes(:task_lists).find(cookies.signed[:session])
  end
end
