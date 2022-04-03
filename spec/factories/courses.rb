FactoryBot.define do
  factory :course do
    name { Faker::Hobby.activity }
    teacher_name { Faker::Name.name }
    description { Faker::Lorem.word }
  end
end
