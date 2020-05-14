class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @event = Event.new
  end

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new( admin_id: current_user.id,
                        title: params[:title],
                        description: params[:description],
                        location: params[:location],
                        price: params[:price],
                        start_date: params[:start_date],
                        duration: params[:duration])
    if @event.save
      flash[:success] = ""
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end
