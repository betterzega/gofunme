class UserEventsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end
end
