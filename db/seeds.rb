# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Event.destroy_all
Bar.destroy_all

puts 'Creating users...'
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "password"
    # password_confirmation: "password"
    )
  user.save!
end


puts 'Creating bars...'
10.times do
  bar = Bar.new(
    name: Faker::Friends.location,
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: Faker::Lorem.paragraph,
    website: Faker::Internet.url,
    user: User.all.order('RANDOM()').first()
    )
  bar.save!
end

puts 'Creating events...'
20.times do
  event = Event.new(
    title: Faker::HowIMetYourMother.catch_phrase,
    category: ['live music', 'trivia', 'poetry reading', 'sports', 'comedy'].sample,
    bar: Bar.all.order('RANDOM()').first()
    )
  event.save!
end
