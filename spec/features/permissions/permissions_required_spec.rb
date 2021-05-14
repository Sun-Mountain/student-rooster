# frozen_string_literal: true

RSpec.feature 'permission required to view team content' do
  context 'success' do
    scenario 'cannot view other team content' do
      user1 = create(:user)
      user2 = create(:user)

      team = create(:team)

      user1.teams << team

      sign_in user2

      visit edit_team_path(team)

      expect(page).to have_content('You are not a part of that team.')

      user2.teams << team

      visit edit_team_path(team)

      expect(page).to have_content('Edit Team')
    end

    scenario 'cannot view other lesson content' do
      user1 = create(:user)
      user2 = create(:user)

      team = create(:team)

      lesson = create(:lesson)

      user1.teams << team
      team.lessons << lesson

      sign_in user2

      visit team_lesson_path(team_id: team.id, id: lesson.id)

      expect(page).to have_content('You are not a part of that team.')
    end
  end
end