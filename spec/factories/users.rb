# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }

    confirmation_sent_at { DateTime.now }
    confirmed_at { DateTime.now }

    password { '12345ABCDEfghi!' }
    password_confirmation { '12345ABCDEfghi!' }
  end
end
