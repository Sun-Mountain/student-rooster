# frozen_string_literal: true

RSpec.feature 'deleting lessons' do
  let!(:user) { create :user }
  let!(:team) { create :team }
  let!(:lesson) { create :lesson }
  let!(:roster) { create :roster }

  before(:each) do
    sign_in user
    visit root_path
  end

  context 'success' do
    scenario 'delete from lesson dashboard' do
      team = create(:team)
      user.teams << team
      lesson1 = create(:lesson, team_id: team.id)
      lesson2 = create(:lesson, team_id: team.id)
      new_roster = create(:roster)
      lesson1.rosters << new_roster
      lesson2.rosters << new_roster

      visit team_lesson_path(team.id, lesson1.id)

      expect(page).to have_content(new_roster.begin_date.try(:to_formatted_s, :rfc822))
      expect(page).to have_content(new_roster.end_date.try(:to_formatted_s, :rfc822))

      expect(lesson1.rosters).to include(new_roster)
      expect(lesson2.rosters).to include(new_roster)

      find("[data-test=\"delete-roster-#{new_roster.id}\"]").click

      expect(page).not_to have_content(new_roster.begin_date.try(:to_formatted_s, :rfc822))
      expect(page).not_to have_content(new_roster.end_date.try(:to_formatted_s, :rfc822))

      visit team_lesson_path(team.id, lesson2.id)

      expect(page).to have_content(new_roster.begin_date.try(:to_formatted_s, :rfc822))
      expect(page).to have_content(new_roster.end_date.try(:to_formatted_s, :rfc822))

    end
  end
end