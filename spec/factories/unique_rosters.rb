FactoryBot.define do
  factory :unique_roster do
    association :student
    association :roster
    association :lesson
  end
end
