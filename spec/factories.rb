FactoryGirl.define do 
  factory :user do 
    name "Ben Wickerson"
    email "ben.wickerson@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end