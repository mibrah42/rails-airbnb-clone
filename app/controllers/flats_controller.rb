class FlatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def search
    @flats = Flat.available(params[:search_start], params[:search_end], params[:destination], params[:guests])
  end

  def index
   @flats = Flat.all

    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking =  Booking.new
    # @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flats_params)
    @flat.user = current_user

    return end_method(:success, Messages.render(:success), :redirect_to, @flat ) if @flat.save
    end_method(:warning, Messages.render(:failure), :render, :new)

    # Old code
    # if @flat.save
    #  redirect_to flat_path(@flat)
    # else
    #  render :new
    # end
  end

  private
  def flats_params
    params.require(:flat).permit(:title, :price, :address, :description, :bedrooms, :capacity, :category, :photo)
  end

end
