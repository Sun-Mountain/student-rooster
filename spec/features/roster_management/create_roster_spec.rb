# frozen_string_literal: true

RSpec.feature 'creating rosters' do
  let!(:user) { create :user }

  before(:each) do
    sign_in user
    visit root_path
  end

  context 'success' do
    scenario 'create roster for one lesson' do
      team = create(:team)
      user.teams << team
      lesson = create(:lesson, team_id: team.id)

      visit team_lesson_path(team.id, lesson.id)

      fill_in :roster_name, with: 'Monday'
      page.find('#roster_begin_date').set("2021-01-01")
      page.find('#roster_end_date').set("2021-01-31")

      click_on("Add Roster")

      expect(page).to have_content("Roster added to #{lesson.name}.")
    end

    scenario 'create roster for all' do
      team = create(:team)
      user.teams << team
      lesson1 = create(:lesson, team_id: team.id)
      lesson2 = create(:lesson, team_id: team.id)

      visit root_path

      fill_in :roster_name, with: 'Monday'
      page.find('#roster_begin_date').set("2021-01-01")
      page.find('#roster_end_date').set("2021-01-31")

      click_on("Add to All Lessons")

      expect(page).to have_content("Roster added to all Lessons.")
    end
  end
end
