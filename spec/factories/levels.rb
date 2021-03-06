require 'faker'
FactoryGirl.define do 
  factory :level do |f| 
    f.name {Faker::Company.name}
    f.description {Faker::Lorem.sentence}
    f.pillar {Faker::Number.digit}
    f.points 2000
  end
  
  factory :invalid_level, parent: :level do |f| 
    f.name nil
  end
end