class TasksController < ApplicationController
  before_action :any_user

  def index
    @user = User.includes(:task_lists).find(cookies.signed[:session])
  end
end
