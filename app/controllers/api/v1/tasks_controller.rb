class Api::V1::TasksController < ApplicationController
  respond_to :json

  def update
    respond_with Task.find(params[:id]).update(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:status)
  end
end
