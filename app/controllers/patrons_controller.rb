class PatronsController < ApplicationController
  before_action :confirm_user_permission, only: [:update, :show, :edit, :destroy]

  def new
    @user = Patron.new
  end

  def create
    user = Patron.new(user_params)
    UserCredential.new_login_credentials_for(user, credential_params)
    if user.save
      set_session(user)
      redirect_to secret_path
    else
      flash[:errors] = user.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email)
  end

  def credential_params
    params.require(:user).permit(:password)
  end
end