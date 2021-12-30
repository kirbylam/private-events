class EventAttendeesController < ApplicationController
  before_action :require_login

  def create
    @eventattendee = EventAttendee.new(attended_event_id: params[:id])
    @eventattendee.attendee_id = session[:current_user_id]
    puts @eventattendee.errors.full_messages unless @eventattendee.save
    redirect_back fallback_location: root_path
  end

  private
    def require_login
      return true if session[:current_user_id]
      redirect_to new_session_path
    end

end
