class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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
    @event.start_date = Event.convert_date_time(params[:date], params[:hour])
    @event.admin = current_user
    puts event_params
    if @event.save
      redirect_to @event
    else 
      @date = params[:date]
      @hour = params[:hour]
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :price, :duration)
  end
end
