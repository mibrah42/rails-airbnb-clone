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

    if @booking.save
      redirect_to flat_booking_path(@booking.flat, @booking)
    else
      render :new
    end
  end

  private
  ###
  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :guests)
  end

end
