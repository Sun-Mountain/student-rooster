FactoryBot.define do
  factory :unique_roster do
    association :student
    association :roster
    association :lesson

    student { nil }
    roster { nil }
    lesson { nil }
  end
end
