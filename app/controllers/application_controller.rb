class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_cookie
    redirect_to tasks_path if cookies.signed[:session]
  end

  def current_user
    User.find(cookies.signed[:session])
  end

  def any_user
    unless cookies.signed[:session]
      flash[:red] = "You need to be logged in!"
      redirect_to root_path
    end
  end
end
