module SessionHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user!
    @current_user ||= User.find(session[:user_id])
  end

  def set_session(user)
    session[:user_id] = user.id
  end

  def end_session
    session.delete(:user_id)
    @current_user = nil
  end

   
end