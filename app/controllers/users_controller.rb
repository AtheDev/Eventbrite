class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @events = Event.where(admin: current_user)
    @email = current_user.email
    @user = current_user
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

end
