class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      cookies.encrypted[:user_id] = user.id
      flash[:success] = "User logged in successfully"
      redirect_to root_path
    else
      session[:user_id] = nil
      flash.now[:danger] = "Invalid Email or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "User logged out successfully"
    redirect_to root_path
  end
end
