# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating users...'
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "password"
    # password_confirmation: "password"
    )
  user.save!
end

puts 'Cleaning database...'
Bar.destroy_all

puts 'Creating bars...'
bar_attributes = [
  {
    name:         "ORA",
    user_id:       1,
    location:      "Oranienplatz 14 10999 Berlin Germany",
    description:  "Once the chemist of choice for Kreuzberg junkies scoring their methadone scripts, Ora is today a stylish new bar and coffeehouse on Oranienplatz.",
    rating:        4.5,
    category:     "Cafe, Cocktail Bar",
    website:      "fitchersvogel.com",
    price_level:  2,
    # photos:       "https://s3-media4.fl.yelpcdn.com/bphoto/tV2sKihAn0VpIVOnZbkRdg/o.jpg"
  },
  {
    name:         "Lerchen & Eulen",
    user_id:       2,
    location:     "Pücklerstr. 33 10997 Berlin Germany",
    description:  "Very cozy atmosphere with lots of locals and many sofas! Great affordable beer (take Augustiner) and cocktails, and fancy stuff like Vodka-Coffee shots.",
    rating:        4.5,
    category:     "Dive Bar",
    website:      "fitchersvogel.com",
    price_level:  1,
    # photos:       "https://s3-media4.fl.yelpcdn.com/bphoto/qkoteYHW58574gYpnGFO4Q/o.jpg"
  },
  {
    user_id:       3,
    name:         "Multilayerladen",
    location:     "Adalbertstr. 4 10999 Berlin Germany",
    description:  "This bar hosts cool concerts regularly. Even if there is no event, you'll definitely enjoy the intimate atmosphere.",
    rating:        4,
    category:     "Music Venue, Bar",
    website:      "fitchersvogel.com",
    price_level:  1,
    # photos:       "https://s3-media1.fl.yelpcdn.com/bphoto/NUfTMYviR4fTXIJY782zIg/o.jpg",
  },

  {
    user_id:       4,
    name:         "Fitcher’s Vogel",
    location:     "AWarschauer Str. 26 10243",
    description:  "Great, cosy little bar with shabby chic decor.",
    rating:        4.5,
    category:     "Bar",
    website:      "fitchersvogel.com",
    price_level:  1,
    # photos:       "https://s3-media1.fl.yelpcdn.com/bphoto/3gPHLKOu1dJQsMnJfs3DoQ/o.jpg"
  },

  {
    user_id:       5,
    name:         "Billard House Friedrichshain",
    location:     "Rudolfstr. 4 10245 ",
    description:  "Enjoy a game, share time, chat and have a glass or two: all this and more can be had at the down-to-Earth Billard House Friedrichshain.",
    rating:        4.5,
    category:     "Pool Hall, Sports Bar",
    website:      "billard-berlin.de",
    price_level:  2,
    # photos:       "https://s3-media3.fl.yelpcdn.com/bphoto/H1O9N2LWlatLL6x4Q_Ffmg/o.jpg"
  },

    {
    user_id:       1,
    name:         "Loch Ness",
    location:     "Roonstr. 31 a 12203 Berlin ",
    description:  "A great scottish pub and whiskey bar.",
    rating:        4.5,
    category:     "Pub",
    website:      "loch-ness-pub.de",
    price_level:  2,
    # photos:       "https://s3-media1.fl.yelpcdn.com/bphoto/jNSCmIyc4Z44EWVwiMmC5g/o.jpg"
  },

   {
    user_id:       2,
    name:         "Die Kleine Weltlaterne",
    location:     "Roonstr. 31 a 12203 Berlin ",
    description:  "Die kleine Weltlaterne is an excellent German restaurant that features live jazz two to three times a week and also has occasional comedy nights.",
    rating:        4.5,
    category:     "Dive Bar, Jazz & Blues, Comedy Club",
    website:      "diekleineweltlaterne.de",
    price_level:  2,
    # photos:       "https://s3-media3.fl.yelpcdn.com/bphoto/idCJfrv8OyeFMlBHkt_Vvw/o.jpg",
  },


   {
    user_id:       3,
    name:         "Hops & Barley Hausbrauerei",
    location:     "Wühlischstr. 22 - 23 10245 Berlin ",
    description:  "One of the pioneers of the Berlin craft beer movement, Hops & Barley has been brewing their own pils, weizen, cider, and stout since 2008. An inviting space housed in a former butcher shop, it gets packed on weekends and on Bundesliga game nights",
    rating:        4.5,
    category:     "Brewery, Sports Bars",
    website:      "hopsandbarley-berlin.de",
    price_level:  1,
    # photos:       "https://s3-media1.fl.yelpcdn.com/bphoto/uNX4bAvr9iO7aG2TNCxROg/o.jpg",
  },

     {
    user_id:       4,
    name:         "Bebel Bar & Lounge",
    location:     "Wühlischstr. 22 - 23 10245 Berlin ",
    description:  "Housed in Berlin's super-swanky Hotel de Rome, Bebel is a chic and elegant place to kick off your evening.",
    rating:        4,
    category:     "Cocktail Bar, Champagne Bar, Pub",
    website:      "hopsandbarley-berlin.de",
    price_level:  4,
    # photos:       "https://s3-media2.fl.yelpcdn.com/bphoto/JY1t8yhWonYvL9wDbTkndg/o.jpg"
  },

   {
    user_id:       5,
    name:         "Homes",
    location:     "Wühlischstr. 22 - 23 10245 Berlin ",
    description:  "A great cocktail bar.",
    rating:        3.5,
    category:     "Schlesische Str. 28 10997",
    website:      "homes-berlin.de",
    price_level:  2,
    # photos:       "https://s3-media1.fl.yelpcdn.com/bphoto/6bJpVjX49SJdp2JJN-OoOw/o.jpg"
  }
]
Bar.create!(bar_attributes)
puts 'Finished!'

puts 'Cleaning database...'
Event.destroy_all

puts 'Creating events...'
event_attributes = [
  {
    bar_id: 1,
    title: "Bar Trivia Night",
    description: "Come test your trivia skills during the new Thursday Bar Trivia Night event from 7 p.m. to 9 p.m. Our quiz master will challenge the crowd with fun and entertaining trivia ranging from sports, pop culture, music, and holiday trivia.
                  Residents are encouraged to bring friends along to compete, each team will be composed of groups of four people for an exciting four rounds of trivia, with music playing in between.",
    category: "Trivia",
    date: "2017-9-14",
    start_time: "7:00",
    end_time: "9:00",
},

 {
    bar_id: 1,
    title: "Bar Trivia Night: Sports",
    description: "Come test your trivia skills during the new Bar Trivia Night event from 7 p.m. to 9 p.m. Our quiz master will challenge the crowd with fun and entertaining trivia ranging from sports, pop culture, music, and holiday trivia.
                  Residents are encouraged to bring friends along to compete, each team will be composed of groups of four people for an exciting four rounds of trivia, with music playing in between.",
    category: "Trivia",
    date: "2017-9-12",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 1,
    title: "Poetry Reading",
    description: "Poetry (the term derives from a variant of the Greek term, poiesis, 'making') is a form of literature that uses aesthetic and rhythmic qualities of language—such as phonaesthetics, sound symbolism, and metre—to evoke meanings in addition to, or in place of, the prosaic ostensible meaning.",
    category: "Poetry Reading",
    date: "2017-9-12",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 7,
    title: "Micah Thomas Jazz Night",
    description: "Pianist and composer Micah Thomas grew up in Columbus, Ohio. From his sophomore year of high school onwards, Micah began gigging regularly with violinist Christian Howes, accompanying him on tours across the country, and has been a regular faculty member at his annual Creative Strings Workshop since 2015.",
    category: "Live Music",
    date: "2017-9-13",
    start_time: "6:00",
    end_time: "8:00",
},

{
    bar_id: 7,
    title: "Live Music! The Best of the Blues",
    description: "Pianist and composer Micah Thomas grew up in Columbus, Ohio. From his sophomore year of high school onwards, Micah began gigging regularly with violinist Christian Howes, accompanying him on tours across the country, and has been a regular faculty member at his annual Creative Strings Workshop since 2015.",
    category: "Live Music",
    date: "2017-9-12",
    start_time: "7:00",
    end_time: "10:00",
},

{
    bar_id: 7,
    title: "Charles Turner Jazz Night",
    description: "Recently the 1st place winner of the  1st Annual Duke Ellington Vocal Competition here in New York City Hosted by  Mercedes Ellington, 26 year old  Turner has taken the jazz scene by storm. Charles relocated to New York in 2011, and has performed in venues such as Smoke Jazz and Super Club, Birdland, Ginny's Supper Club, Smalls, and Mintons were has a residency every Wednesday with the JC Hopkins Biggish Band and every Thursday with Marc Cary and Focus Trio at Gin Fizz in Harlem.",
    category: "Live Music",
    date: "2017-9-11",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 7,
    title: "Comedy with Hannibal Burress",
    description: "Hannibal Buress is a comedian, actor, writer, musician, magician, and poker dealer from Chicago.
                  He’s appeared on television a lot. At least 10 times. Actually it’s way more than that. He’s the cohost of The Eric Andre Show on Adult Swim. He’s a cast member on Broad City on Comedy Central. He’s had failed tv show deals of his own. He tours regularly doing stand up comedy. There’s other stuff on google that you can find. Have a nice day.",
    category: "Comedy",
    date: "2017-9-12",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 8,
    title: "Greatest Comedy Show Ever",
    description: "Hannibal Buress is a comedian, actor, writer, musician, magician, and poker dealer from Chicago.
                  He’s appeared on television a lot. At least 10 times. Actually it’s way more than that. He’s the cohost of The Eric Andre Show on Adult Swim. He’s a cast member on Broad City on Comedy Central. He’s had failed tv show deals of his own. He tours regularly doing stand up comedy. There’s other stuff on google that you can find. Have a nice day.",
    category: "Comedy",
    date: "2017-9-12",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 10,
    title: "Berlin's Best Local Singers",
    description: "Music is an art form and cultural activity whose medium is sound organized in time. The common elements of music are pitch (which governs melody and harmony), rhythm (and its associated concepts tempo, meter, and articulation), dynamics (loudness and softness), and the sonic qualities of timbre and texture (which are sometimes termed the 'color' of a musical sound).",
    category: "Live Music",
    date: "2017-9-13",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 3,
    title: "Drunk Drawing",
    description: "A sketch (ultimately from Greek σχέδιος – schedios, done extempore) is a rapidly executed freehand drawing that is not usually intended as a finished work.[4] A sketch may serve a number of purposes: it might record something that the artist sees, it might record or develop an idea for later use or it might be used as a quick way of graphically demonstrating an image, idea or principle We do this drunk.",
    category: "Art",
    date: "2017-9-11",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 3,
    title: "Drunk Drawing",
    description: "A sketch (ultimately from Greek σχέδιος – schedios, done extempore) is a rapidly executed freehand drawing that is not usually intended as a finished work.[4] A sketch may serve a number of purposes: it might record something that the artist sees, it might record or develop an idea for later use or it might be used as a quick way of graphically demonstrating an image, idea or principle We do this drunk.",
    category: "Art",
    date: "2017-9-12",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 5,
    title: "Eagles vs. Jets",
    description: "Hannibal Buress is a comedian, actor, writer, musician, magician, and poker dealer from Chicago.
                  He’s appeared on television a lot. At least 10 times. Actually it’s way more than that. He’s the cohost of The Eric Andre Show on Adult Swim. He’s a cast member on Broad City on Comedy Central. He’s had failed tv show deals of his own. He tours regularly doing stand up comedy. There’s other stuff on google that you can find. Have a nice day.",
    category: "Sports",
    date: "2017-9-11",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 5,
    title: "Billiard's Tournament",
    description: "Cue sports (sometimes written cuesports), also known as billiard sports,[ are a wide variety of games of skill generally played with a cue stick, which is used to strike billiard balls and thereby cause them to move around a cloth-covered billiards table bounded by elastic bumpers known as cushions.",
    date: "2017-9-11",
    start_time: "7:00",
    end_time: "9:00",
},

{
    bar_id: 5,
    title: "Darts Tournament",
    description: "Hannibal Buress is a comedian, actor, writer, musician, magician, and poker dealer from Chicago.
                  He’s appeared on television a lot. At least 10 times. Actually it’s way more than that. He’s the cohost of The Eric Andre Show on Adult Swim. He’s a cast member on Broad City on Comedy Central. He’s had failed tv show deals of his own. He tours regularly doing stand up comedy. There’s other stuff on google that you can find. Have a nice day.",
    category: "Games",
    date: "2017-9-12",
    start_time: "8:00",
    end_time: "10:00",
},

{
    bar_id: 1,
    title: "Rugby! Toulon vs Paris",
    description: "Rugby is a game similar to football developed at Rugby School in Rugby, Warwickshire, one of many versions of football played at English public schools in the 19th century.[1] The two main types (known as codes) of rugby are rugby league and rugby union. Although rugby league initially used rugby union rules, they are now wholly separate sports.",
    category: "Games",
    date: "2017-9-12",
    start_time: "8:00",
    end_time: "10:00",
}
]

Event.create!(event_attributes)
puts 'Finished!'

puts 'Cleaning database...'
Review.destroy_all

puts 'Creating reviews...'

review_attributes = {
    rating: 4,
    content: "This is the best bar in the whole wide world!"
}

Bar.all.each do |bar|
  2.times do
    review = Review.new(rating: (4..5).to_a.sample, content: [
      "The perfect neighborhood spot to meet friends for drinks and a little bit of entertainment! Friendly and attentive bartenders prepare tasty cocktails and offer beer recommendations that are on point. ",
      "If you're in the area definitely check this place out--great atmosphere, great drinks, great food, and a great staff/owners.",
      "The perfect neighborhood bar.  Drink-wise, there's a great assortment of beers on tap (including some choices from nearby Folksbier), plus some good cocktails.  The food is actually delicious!",
      "They have a great selection of beers, and some unique shot specials. The prices are fair, especially if you're used to spending like twelve bucks for a beer at some trendier spots."].sample)
    review.bar = bar
    review.save
  end
end


