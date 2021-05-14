FactoryBot.define do
  factory :lesson do
    sequence(:name) { |n| "lesson_#{n}" }
  end
end
