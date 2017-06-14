class FlatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def search
    destination = params[:destination]
    start_date = params[:start]
    end_date = params[:end]
    guests = params[:guests]

    range = (start_date..end_date)
    booked_on_start = Flat.includes(:bookings).where(bookings: {start_date: range})
    booked_on_end = Flat.includes(:bookings).where(bookings: {end_date: range})

    start_ids = booked_on_start.map {|f| f.id }
    end_ids = booked_on_end.map {|f| f.id }

    booked_ids = (start_ids + end_ids).uniq
    raise
    @availables = Flat.where.not(id: booked_ids)

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
