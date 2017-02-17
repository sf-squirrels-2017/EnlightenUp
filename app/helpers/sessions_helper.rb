module SessionsHelper

  def login(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user || User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def is_current_user?(user)
    current_user == user
  end
end
