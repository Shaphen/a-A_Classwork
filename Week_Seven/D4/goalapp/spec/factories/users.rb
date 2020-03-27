FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.character }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
