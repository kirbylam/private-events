class EventsController < ApplicationController
  before_action :is_signed_in?, only: [:new, :create]
  
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
    def event_params
      params.require(:event).permit(:name, :location, :date)
    end

    def is_signed_in?
      if session[:current_user_id].nil?
        redirect_to new_session_path if session[:current_user_id].is_nil?
      else
        true
      end
    end
end

