require 'csv'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Ben Wickerson",
                 email: "ben.wickerson@gmail.com",
                 password: "123test",
                 password_confirmation: "123test",
                 admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
      end
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end

    Player.create!(first_name: "Alastair", last_name: "Cook", dob: "25/12/1984", country_of_birth: 247 )
    Player.create!(first_name: "Nick", last_name: "Compton", dob: "26/06/1983", country_of_birth: 247 )
    Player.create!(first_name: "Jonathon", last_name: "Trott", dob: "22/04/1981", country_of_birth: 214 )
    Player.create!(first_name: "Kevin", last_name: "Petersen", dob: "27/06/1980", country_of_birth: 214 )
    Player.create!(first_name: "Ian", last_name: "Bell", dob: "11/04/1982", country_of_birth: 247 )
    Player.create!(first_name: "Jonny", last_name: "Bairstow", dob: "26/09/1989", country_of_birth: 247 )
    Player.create!(first_name: "Matt", last_name: "Prior", dob: "26/02/1982", country_of_birth: 214 )
    Player.create!(first_name: "Stuart", last_name: "Broad", dob: "24/06/1986", country_of_birth: 247 )
    Player.create!(first_name: "Jimmy", last_name: "Anderson", dob: "30/07/1982", country_of_birth: 247 )
    Player.create!(first_name: "Graeham", last_name: "Swann", dob: "24/03/1979", country_of_birth: 247 )
    Player.create!(first_name: "Stephen", last_name: "Finn", dob: "04/04/1989", country_of_birth: 247 )

    CSV.foreach('lib/tasks/countries.csv', headers: true) do |row|
      Country.create!(row.to_hash)
    end
  end
end
