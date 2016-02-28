class ArtistsController < ApplicationController
  #before_action :confirm_user_permission, only: [:edit, :update, :destroy]

  def index
  end

  def new
    if request.xhr?
      render partial: "new_artist_signup"
    else
      @artist = Artist.new
      render 'new'
    end
  end

  def create
  end

  def profile
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def artist_params
    params.require(:artist).permit()
  end
end