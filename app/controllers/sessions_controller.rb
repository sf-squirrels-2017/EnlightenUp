class SessionsController < ApplicationController
  include SessionsHelper

def new
end

def create
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
    login(@user)
    redirect_to @user
  else
    flash[:danger] = "Invalid email and/or password."
    render_new
  end
end

def destroy
end

end
