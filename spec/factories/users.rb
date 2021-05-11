# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "user_name_#{n}" }
    sequence(:full_name) { |n| "full_name_#{n}" }

    password { 'mavericks' }
    password_confirmation { 'mavericks' }
  end
end