class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_logged?
  
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

  def is_logged?
    !!current_user
  end

  def require_user
    if !is_logged?
      flash[:danger] = "You require to login to perform this action"
      redirect_to login_path
    end
  end
end
