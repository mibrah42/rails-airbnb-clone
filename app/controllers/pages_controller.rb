class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @booked_flats = @user.booked_flats
    @flats = @user.owned_flats

  end

end
