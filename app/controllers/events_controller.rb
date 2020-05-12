class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new( 'admin_id' => params[:current_user.id],
                        'title' => params[:title],
                        'description' => params[:description],
                        'location' => params[:location],
                        'price' => params[:price],
                        'start_date' => params[:start_date],
                        'duration' => params[:duration])
    @event.save
    redirect_to root_path
  end

end
