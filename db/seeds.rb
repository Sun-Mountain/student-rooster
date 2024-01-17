# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all

User.create!([
  {
    username: "Captain Picard",
    email: "picard@gmail.com",
    password: "123456",
    role: 4,
    confirmed_at: Time.now,
  }
])

p "Created #{User.count} Users"

Team.destroy_all

Team.create!([
  {
    name: "Enterprise",
  }
])

p "Created #{Team.count} Teams"

TeamOwnership.destroy_all

TeamOwnership.create!([
  {
    team_id: 1,
    user_id: 1,
  }
])

p "Created #{TeamOwnership.count} Team_Ownerships"

Lesson.destroy_all

Lesson.create!([
  {
    title: "How to be a Captain",
    team_id: 1,
  },
  {
    title: "How to be a First Officer",
    team_id: 1,
  }
])

p "Created #{Lesson.count} Lessons"