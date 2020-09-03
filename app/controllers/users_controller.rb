class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update, :delete]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies.encrypted[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.name}"
      redirect_to root_path
    else
      flash[:danger] = "Please enter valid details"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User details updated successfully"
      redirect_to root_path
    else
      flash[:danger] = "Please enter valid details"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted successfully"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
