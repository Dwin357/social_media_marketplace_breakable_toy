class EventsController < ApplicationController
  before_action :confirm_current_user_is_venue, except: [:index, :show]

  def index
    @events = Event.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit()
  end
end