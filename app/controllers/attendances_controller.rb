class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :authenticate_admin, only: [:index]

  def index
    @attendance = Attendance.where(event_id: params[:event_id])
  end

  def new
    @attendance = Attendance.new
    @amount = Event.find_by(id: params[:event_id]).price
    @amount = @amount * 100
  end

  def create
    @amount = Event.find_by(id: params[:event_id]).price
    @amount = @amount * 100

    if @amount != 0

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @attendance = Attendance.new(user_id: current_user.id,
                                event_id: params[:event_id],
                                stripe_customer_id: customer.id)
    @attendance.save

    else
      @attendance = Attendance.new(user_id: current_user.id,
                                event_id: params[:event_id])
      @attendance.save
    end

    rescue Stripe::CardError => e
    flash[:error] = e.message

  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

  def authenticate_admin
     unless current_user == Event.find_by(id: params[:event_id]).admin
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

end
