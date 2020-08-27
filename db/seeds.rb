require 'faker'

puts 'Clearing data'

User.destroy_all
Listing.destroy_all
Booking.destroy_all

puts 'Creating 10 fake users...'

10.times do
  user = User.create!(
    first_name: Faker::Name.unique.name,
    last_name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: "123456"
  )
end
puts 'Finished!'

puts 'Creating 10 fake listings...'

10.times do
  listing = Listing.create!(
    picture: Faker::Placeholdit.image(size: "50x50"),
    home_type: (0..2).to_a.sample,
    address: Faker::Address.street_address,
    location: "#{Faker::Address.latitude}, #{Faker::Address.longitude}",
    price: Faker::Number.between(from: 50, to: 200),
    user: User.find((1..10).to_a.sample)
  )
end
puts 'Finished!'

puts 'Creating 10 fake bookings...'
10.times do
  booking = Booking.create!(
    user_id: (1..10).to_a.sample,
    listing_id: (1..10).to_a.sample,
    checkin_on: Faker::Date.backward(days: 10),
    checkout_on: Faker::Date.forward(days: 10),
    created_at: Faker::Date.between(from: 15.days.ago, to: Date.today),
    updated_at: Faker::Date.between(from: 5.days.ago, to: Date.today)
  )
end
puts 'Finished!'
