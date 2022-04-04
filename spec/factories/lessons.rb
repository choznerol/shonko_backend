FactoryBot.define do
  factory :lesson do
    name { Faker::Hobby.activity }
    description { Faker::Lorem.word }
    content { Faker::Hobby.activity }
    position { 0 }
    section
  end
end
