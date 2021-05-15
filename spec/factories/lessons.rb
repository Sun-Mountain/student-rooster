FactoryBot.define do
  factory :lesson do
    association :team
    sequence(:name) { |n| "lesson_#{n}" }
  end
end
