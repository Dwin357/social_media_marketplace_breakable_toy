class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  private

  def confirm_user_permission
    unless current_user
      flash[:errors] = ["please login to access that"]
      redirect_to root_path
    end
  end

  # # no admin attribute feature on user model, but if
  # def confirm_admin_permission
  #   unless current_user && current_user.admin?
  #     @errors = ["please login as an admin to access that"]
  #     redirect_to root
  # end
end
