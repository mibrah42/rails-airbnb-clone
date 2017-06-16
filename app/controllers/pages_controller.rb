class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @booked_flats = @user.bookings
    @bookings = Booking.all
    @flats = @user.owned_flats

    @flats_array = @flats.map do |flat|
       flat.id
    end


  end




end
