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

    # 99.times do |n|
    #   name = Faker::Name.name
    #   email = "example-#{n+1}@railstutorial.org"
    #   password = "password"
    #   User.create!(name: name,
    #                email: email,
    #                password: password,
    #                password_confirmation: password,
    #                country_id: rand(250))
    #   end

    # users = User.all(limit: 6)

    # 50.times do
    #   content = Faker::Lorem.sentence(5)
    #   users.each { |user| user.microposts.create!(content: content) }
    # end

    CSV.foreach('lib/tasks/countries.csv', headers: true) do |row|
      Country.create!(row.to_hash)
    end

    CSV.foreach('lib/tasks/players.csv', headers: true) do |row|
      Player.create!(row.to_hash)
    end

    # 99.times do |n|
    #   first_name = Faker::Name.first_name
    #   last_name = Faker::Name.last_name
    #   country_id = rand(250)
    #   hand = ["Right","Left"].sample
    #   specialism_id = rand(4) + 1
    #   dob = rand(32.years).ago - 18.years
    #   Player.create!(first_name: first_name,
    #                last_name: last_name,
    #                country_id: country_id,
    #                hand: hand,
    #                dob: dob,
    #                specialism_id: specialism_id)
    #   end

    Team.create!(name: "Norwich Wanderers", country_id: 247, user_id: 1, home_ground_id: 1)
    Team.create!(name: "Lewisham Lackies", country_id: 247, user_id: 1, home_ground_id: 2)

    Ground.create!(name: "Norwich Cricket Club Grounds", 
                address: "1 Ferry Lane, Postwick, Norwich, Norfolk NR13 5HL, Tel: 01603 431513", 
             country_id: 247, 
               capacity: 3400, 
                    url: "http://www.norwichcricketclub.co.uk/")
    Ground.create!(name: "Lewisham Cricket Club", 
                address: "Rubens Street, Catford, London, SE6 4DH", 
             country_id: 247, 
               capacity: 1200, 
                    url: "http://catfordcyphers.btck.co.uk/")

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
