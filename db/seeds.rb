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
location_choices =
['786 St. Johns Pl, Brooklyn, NY',
  '1168 Union St., Brooklyn, NY', #works
  '3 Lisa Court, Yorktown Heights, NY', #works
  'Crown Inn, Crown Heights, Brooklyn',
  'The Library Bar, New York City', #works
  'The Dead Rabbit, Financial District, NY',
  'Carroll Gardens, NY',
  'Nostrand Bar, Crown Heights, Brooklyn',
  'Two Saints, Crown Heights, Brooklyn', #works
  'East Village, New York' #works
  ]
location_choices.size.times do
  bar = Bar.new(
    name: Faker::Friends.location,
    location: location_choices.delete(location_choices.sample),
    # location: "#{(500..3000).to_a.sample} #{['Union Street', 'Broadway 5th Ave', 'Bedford Ave'].sample} New York City",
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
