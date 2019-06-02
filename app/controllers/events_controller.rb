class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])

    if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(create_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
    event = current_user.events.find(params[:id])
    event.destroy
    flash[:success] = "Successfully deleted the event"
    redirect_to user_events_path(current_user)
  end

  private

  def create_params
    params.require(:event).permit(:title, :description, :image_url, :start_at, :end_at)
  end
end
