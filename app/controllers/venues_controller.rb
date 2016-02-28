class VenuesController < ApplicationController
  #before_action :confirm_user_permission, only: [:edit, :update, :destroy]

  def index
  end

  def new
    if request.xhr?
      render partial: "new_venue_signup"
    else
      @venue = Venue.new
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
  def venue_params
    params.require(:venue).permit()
  end
end