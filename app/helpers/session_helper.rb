module SessionHelper
  def current_user
    @current_user ||= session[:user_type].constantize.find_by_id(session[:user_id])
  end

  def current_user!
    @current_user ||= session[:user_type].constantize.find(session[:user_id])
  end

  def set_session(user)
    session[:user_id] = user.id
    session[:user_type] = user.class.to_s
  end

  def end_session
    session.delete(:user_id)
    session.delete(:user_type)
    @current_user = nil
  end

   
end