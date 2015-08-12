FactoryGirl.define do
  factory :api_key do
    account Faker::Internet.email
    key Faker::Lorem.word
  end
end
