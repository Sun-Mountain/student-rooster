FactoryBot.define do
  factory :student do
    association :team
    sequence(:first_name) { |n| "first_name_#{n}" }
    sequence(:last_name) { |n| "last_name_#{n}" }
    sequence(:contact) { |n| "contact_#{n}@gmail.com" }
  end
end
