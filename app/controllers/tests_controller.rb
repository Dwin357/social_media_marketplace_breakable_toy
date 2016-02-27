class TestsController < ApplicationController
  before_action :confirm_user_permission, only: [:secret]
  
  def secret
    # @content = "content" if env['omniauth.auth']
    render 'secret'
  end

  def landing
    render 'landing'
  end
end