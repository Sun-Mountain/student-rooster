# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    sequence(:name) { |n| "Session#{n}" }
    start_date { Date.today }
    end_date { Date.today + 1.week }
  end
end
