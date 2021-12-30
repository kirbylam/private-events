class EventsController < ApplicationController
  before_action :require_login, only: [:logged_in, :new, :create]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = session[:current_user_id]

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  private
    def require_login
      return true if session[:current_user_id]
      redirect_to new_session_path
    end

    def event_params
      params.require(:event).permit(:name, :location, :date)
    end
end
