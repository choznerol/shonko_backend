FactoryBot.define do
  factory :section do
    name { Faker::Hobby.activity }
    position { rand(1...10) }
    course
  end
end
