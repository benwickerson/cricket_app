FactoryGirl.define do 
  factory :user do 
    sequence(:name)   { |n| "Person #{n}" }
    sequence(:email)  { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  
    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Blah blah"
    user
  end

  factory :player do
    first_name "Ben"
    last_name "Wickerson"
    dob "17/03/1981"
    country_id "38"
  end
end

