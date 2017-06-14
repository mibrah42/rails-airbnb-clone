class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_attachment :photo

  validates :title, :price, :address, :description, :bedrooms, :capacity, :category, presence: true

  # Store address in address column after validation (saving)
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # search available bookings
  def self.available(search_start, search_end, location, guests)
    booked = self.includes(:bookings).where("(?, ?) OVERLAPS (bookings.start_date, bookings.end_date)", search_start, search_end).references(:bookings)
    booked_ids = booked.map { |f| f.id }
    self.near(location, 10).where("? <= flats.capacity", guests).where.not(id: booked_ids)
  end

end

# Flat.available("06/14/2017", "06/21/2017", "Barcelona", 4)
