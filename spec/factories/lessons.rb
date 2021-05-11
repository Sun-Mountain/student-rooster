# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    sequence(:name) { |n| "Lesson #{n}" }
  end
end