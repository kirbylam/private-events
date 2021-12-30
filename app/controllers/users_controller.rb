class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_events = Event.where(creator_id: @user.id)
    @events_attending = @user.attended_events
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
