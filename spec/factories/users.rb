# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username_#{n}" }
    sequence(:email) { |n| "email_#{n}@gmail.com" }

    password { '12345ABCDEfghi!' }
    password_confirmation { '12345ABCDEfghi!' }
  end
end
