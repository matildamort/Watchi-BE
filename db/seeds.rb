# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if User.count == 0
    User.create(username: 'MatildaWatcher', firstname: "matilda", lastname: "Morton", email: "matilda.morton@bigpond.com", password: "123456", password_confirmation: "123456")
    User.create(username: 'CameronWatcher', firstname: "Cam", lastname: "jones", email: "iamcrjones@gmail.com", password: "123456", password_confirmation: "123456")
    User.create(username: 'BenWatcher', firstname: "Ben", lastname: "Morton", email: "benamorton@bigpond.com", password: "123456", password_confirmation: "123456")
    User.create(username: 'OscarWatcher', firstname: "Oscar", lastname: "Morton", email: "ObiWon@bigpond.com", password: "123456", password_confirmation: "123456")
end

if Show.count == 0
    Show.create(title: "DBZ", description: "Greatest Show ever", crunchyroll: true, netflix: false, funimation: true, episodes: 100, airdate: "01/01/2022", enddate: "01/01/2023", day: "thursday")
    Show.create(title: "Pokemon", description: "Greatest Show ever", crunchyroll: true, netflix: true, funimation: true, episodes: 6, airdate: "01/01/2020", enddate: "01/01/2024", day: "thursday")
    Show.create(title: "OnePiece", description: "Greatest Show ever", crunchyroll: true, netflix: true, funimation: true, episodes: 60, airdate: "01/01/2020", enddate: "01/01/2024", day: "thursday")
    Show.create(title: "DemonSlayer", description: "Greatest Show ever", crunchyroll: false, netflix: true, funimation: false, episodes: 3, airdate: "01/01/2020", enddate: "01/01/2024", day: "thursday")
end



if Watchlist.count == 0
    Watchlist.create(user_id: 1, show_id: 1)
    Watchlist.create(user_id: 2, show_id: 1)
    Watchlist.create(user_id: 3, show_id: 1)
    Watchlist.create(user_id: 4, show_id: 2)
end


if Review.count == 0
    Review.create(message: "This is a great show", rating: 5, user_id: 1, show_id: 1)
    Review.create(message: "This is a bad show", rating: 1, user_id: 2, show_id: 1)
    Review.create(message: "This is a good show", rating: 3, user_id: 3, show_id: 1)
    Review.create(message: "This is a great show", rating: 5, user_id: 4, show_id: 1)
    Review.create(message: "This is a great show", rating: 5, user_id: 4, show_id: 2)
    Review.create(message: "This is a great show", rating: 5, user_id: 4, show_id: 3)
    Review.create(message: "This is a great show", rating: 5, user_id: 4, show_id: 2)
end
