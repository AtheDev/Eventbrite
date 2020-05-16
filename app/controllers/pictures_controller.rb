class PicturesController < ApplicationController
  def create
    @event = Event.find(:event_id)
    @event.picture.attach(params[:picture])
    redirect_to(event_path(@event))
  end
end
