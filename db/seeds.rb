
CATCH = ["Amazing ", "Great ", "Good ", "Spectacular ", "Big ", "Large "]
KIND = ["house with ", "home with ", "room with ", "room with "]
EXTRAS = ["terrace", "garden", "balcony", "swimming pool", "parking", "concierge"]
ADDRESS_EXAMPLES = ["Carrer de Larrard, 55, 08024 Barcelona", "Carrer del Torrent de l'Olla, 203, 08012 Barcelona", "Carrer d'Aulestia i Pijoan, 32, 08012 Barcelona", "Carrer de Ramón y Cajal, 13, 08012 Barcelona", "Carrer de Francisco Giner, 54, 08012 Barcelona", "Carrer de Vallirana, 29, 08006 Barcelona", "Carrer de Benet Mercadé, 21-23, 08012 Barcelona"]

puts "Cleaning database..."

Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts "Starting seeding process..."

# 10.times do
#   user = User.new(
#     first_name: Faker::Name.first_name ,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.free_email,
#     password: "1234567890"
#   )
#   user.save!


#   rand(0..3).times do
#     url = "http://lorempixel.com/1600/600/city/" + rand(1..10).to_s
#     title_array = CATCH.sample + KIND.sample + EXTRAS.sample
#     flat = Flat.new(
#       price: rand(50..1500),
#       title: CATCH.sample + KIND.sample + EXTRAS.sample,
#       description: Faker::Lorem.paragraph(rand(1..2)),
#       address: ADDRESS_EXAMPLES.sample,
#       bedrooms: rand(1..5),
#       capacity: rand(1..10),
#       category: ["Entire home", "Private room", "Shared room"].sample
#       )
#     flat.user = user
#     flat.save!
#     flat.photo_url = url

#     start_date = Date.new + rand(1..100)
#     end_date = start_date + rand(1..30)

#     booking = Booking.new(
#       start_date: start_date,
#       end_date: end_date,
#       guests: rand(1..5)
#     )
#     booking.user = user
#     booking.flat = flat
#     booking.save!
#   end
# end

puts "Finished seeding process..."
