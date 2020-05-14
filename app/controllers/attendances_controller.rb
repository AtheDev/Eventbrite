class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @amount = Event.find_by(id: params[:event_id]).price
    @amount = @amount * 100
  end

  def create
    @amount = Event.find_by(id: params[:event_id]).price
    @amount = @amount * 100

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

    rescue Stripe::CardError => e
      flash[:error] = e.message


  end

  def index
    @attendance = Attendance.all
  end

end
