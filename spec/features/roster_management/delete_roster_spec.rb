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
      lesson = create(:lesson, team_id: team.id)
      roster = create(:roster)
      lesson.rosters << roster

      visit team_lesson_path(team.id, lesson.id)

      expect(page).to have_content(roster.begin_date.try(:to_formatted_s, :rfc822))
      expect(page).to have_content(roster.end_date.try(:to_formatted_s, :rfc822))

      find("[data-test=\"delete-roster-#{roster.id}\"]").click

      expect(page).not_to have_content(roster.begin_date.try(:to_formatted_s, :rfc822))
      expect(page).not_to have_content(roster.end_date.try(:to_formatted_s, :rfc822))
    end
  end
end