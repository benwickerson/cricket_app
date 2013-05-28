require 'csv'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Ben Wickerson",
                 email: "ben.wickerson@gmail.com",
                 password: "123test",
                 password_confirmation: "123test",
                 admin: true,
                 country_id: 247)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   country_id: rand(250))
      end
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end

    CSV.foreach('lib/tasks/countries.csv', headers: true) do |row|
      Country.create!(row.to_hash)
    end

    CSV.foreach('lib/tasks/players.csv', headers: true) do |row|
      Player.create!(row.to_hash)
    end

    Team.create!(name: "The most amazing team", country_id: 247, user_id: 1)
    Team.create!(name: "These guys are pretty cool", country_id: 67, user_id: 1)

    Specialism.create!(specialism: "Batsman")
    Specialism.create!(specialism: "Bowler")
    Specialism.create!(specialism: "Wicket-keeper")
    Specialism.create!(specialism: "All-rounder")

    t=Team.first
    p=Player.first(11)
    t.players << p

    t=Team.last
    p=Player.last(11)
    t.players << p

  end
end
