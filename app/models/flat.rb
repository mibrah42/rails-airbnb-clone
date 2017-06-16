class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, dependent: :destroy

  has_attachment :photo

  validates :title, :price, :address, :description, :bedrooms, :capacity, :category, presence: true

  # Store address in address column after validation (saving)
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # search available bookings
  def self.available(search_start, search_end, location, guests)
    if search_start.empty? && search_end.empty? && location.empty?
      self.includes(:bookings).where("? <= flats.capacity", guests)

    elsif search_start.empty? || search_end.empty?
      self.near(location, 20).where("? <= flats.capacity", guests)

    elsif location.empty?
      self.includes(:bookings).where.not("(?, ?) OVERLAPS (bookings.start_date, bookings.end_date)", search_start, search_end).where.not(bookings: {status: "confirmed"}).where("? <= flats.capacity", guests)

    else
      booked = self.includes(:bookings).where(bookings: {status: "confirmed"}).where("(?, ?) OVERLAPS (bookings.start_date, bookings.end_date)", search_start, search_end)
      booked_ids = booked.map { |f| f.id }
      self.near(location, 20).where("? <= flats.capacity", guests).where.not(id: booked_ids)

    end
  end

end
