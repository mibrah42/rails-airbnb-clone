require 'faker'

C_START_DATES = ["1/1/2016", "2/2/2016", "3/3/2016", "4/4/2016", "5/5/2016"]
C_END_DATES = ["6/6/2016", "7/7/2016", "8/8/2016", "9/9/2016", "10/10/2016"]
C_GUESTS = (1..10).to_a

C_PRICES = (15..500).to_a
C_BEDROOMS = (1..5).to_a
C_CAPACITY = (1..10).to_a
C_CATEGORY = ["Entire home", "Private room", "Shared room"]

puts "starting seeding..."
puts "cleaning db..."

Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    first_name: Faker::Superhero.name,
    last_name: Faker::Superhero.power,
    email: Faker::Internet.email,
    password: "1234567"
  )
  user.save!

  puts 'Creating 5 fake flats...'

  5.times do
    flat = Flat.new(
      price: C_PRICES.sample,
      title: Faker::LordOfTheRings.location,
      description: Faker::ChuckNorris.fact,
      address: Faker::Address.street_address,
      bedrooms: C_BEDROOMS.sample,
      capacity: C_CAPACITY.sample,
      category: C_CATEGORY.sample
    )
    flat.user = user
    flat.save!

    puts 'Creating 5 fake booking...'

    booking = Booking.new(
      start_date: C_START_DATES.sample,
      end_date: C_END_DATES.sample,
      guests: C_GUESTS.sample
    )
    booking.user = user
    booking.flat = flat
    booking.save!
  end
end

puts 'Finished!'






# users
# albert = User.new(first_name: "Albert", last_name: "Montolio", email: "albert.montolio@gmail.com", password: "1234567")
# ederik = User.new(first_name: "Ederik", last_name: "Van Eindhoven", email: "ederik@gmail.com", password: "1234567")

# flats
# casa1 = Flat.new(price: 35, title: "nice flat in barca", description: "slhgaslghaslfgjhas;fglhasfg", address: "la la land", bedrooms: 2, capacity: 4, category: "private")
# casa2 = Flat.new(price: 75, title: "ugly flat in madrid", description: "siuuuuuu", address: "bla bla land", bedrooms: 3, capacity: 3, category: "private")

# bookings
# booking1 = Booking.new(start_date: "12/06/2017", end_date: "16/06/2017", guests: 2)
# booking2 = Booking.new(start_date: "12/07/2017", end_date: "16/08/2017", guests: 3)

# # associations
# casa1.user = albert
# casa2.user = ederik

# booking1.user = albert
# booking1.flat = casa1

# booking2.user = ederik
# booking2.flat = casa2

# # savings
# albert.save
# ederik.save

# casa1.save
# casa2.save

# booking1.save
# booking2.save

