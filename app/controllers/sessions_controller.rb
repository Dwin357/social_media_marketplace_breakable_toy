class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user.credentials.find_by(authenticator: params[:session][:authenticator]).authentic?(params[:session][:password])
      set_session(user)
      redirect_to secret_path
    else
      flash[:errors] = ["invalid username or login credentials"]
      render 'new'
    end
  end

  def omni_auth
    user = UserCredential.find_or_create_user_from_omni(env['omniauth.auth'])
    set_session(user)
    redirect_to secret_path
  end

  def destroy
    end_session
    redirect_to root_path
  end


end