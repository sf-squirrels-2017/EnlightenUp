class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      flash[:success] = "Welcome to EnlightenUp"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    if is_current_user?(@user)
      render 'show'
    elsif !is_current_user?(@user) && @user.is_mentor?
      render 'show'
    elsif !is_current_user?(@user)
      render '/not_authorized'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.update_attributes(user_params)
    redirect_to @user
  end



  private
  def user_params
    params.require(:user).permit(:name, :phase, :is_mentor, :expertise, :email, :password)
  end
end
