class User < ApplicationRecord
  has_many :flats
  has_many :flats, through: :bookings
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
end
