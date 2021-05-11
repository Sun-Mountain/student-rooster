# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

picard = FactoryBot.create(:user, username: 'CaptainPicard', full_name: 'Jean Luc Picard', email: 'picard@gmail.com')

team = FactoryBot.create(:team, name: 'Enterprise')
picard.teams << team

lindy1 = FactoryBot.create(:lesson, name: 'Lindy 1')
team.lessons << lindy1