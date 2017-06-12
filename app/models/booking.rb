class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :start_date, :end_date, :guests, presence: true

  # after_validation :set_defaults

  # private

  # def set_defaults
    # self.status = "pending" if status.nil?
  # end


end
