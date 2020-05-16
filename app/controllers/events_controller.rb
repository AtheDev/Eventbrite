class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_admin, only: [:edit, :update, :destroy]

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
    @event = Event.new(event_params)
    @event.admin = current_user

    if @event.save
      flash[:success] = ""
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(post_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path

  end

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :picture)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

  def authenticate_admin
     unless current_user == Event.find(params[:id]).admin
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end
