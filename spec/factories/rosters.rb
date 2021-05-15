FactoryBot.define do
  factory :roster do
    sequence(:name) { |n| "roster_#{n}" }
    sequence(:begin_date) { DateTime.now }
    sequence(:end_date) { DateTime.now + 30.days }
  end
end
