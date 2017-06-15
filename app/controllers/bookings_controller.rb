class BookingsController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:new]

  def new
    if user_signed_in?
      @booking = Booking.new
      @flat = Flat.find(params[:flat_id])
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user

    return end_method(:success, Messages.render(:success), :redirect_to, flat_booking_path(@booking.flat, @booking) ) if @booking.save
    end_method(:warning, Messages.render(:failure), :render, :new)

    # Old code
    # if @booking.save
    #  redirect_to flat_booking_path(@booking.flat, @booking)
    # else
    #  render :new
    # end
  end

  def update
    @booking = Booking.find(params[:id])

    if params[:status].downcase == 'confirm'
      @booking.confirmed_status
    elsif params[:status].downcase == 'denied'
      @booking.denied_status
    elsif params[:status].downcase == 'pending'
      @booking.pending_status
    end

    @booking.save

    redirect_to pages_dashboard_path
  end

  private
  ###
  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :guests, :status)
  end

end
