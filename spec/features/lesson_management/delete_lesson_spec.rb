# frozen_string_literal: true

RSpec.feature 'deleting lessons' do
  let!(:user) { create :user }
  let!(:team) { create :team }
  let!(:lesson) { create :lesson }

  before(:each) do
    user.teams << team
    team.lessons << lesson
    sign_in user
    visit root_path
  end

  context 'success' do
    scenario 'from portal dashboard' do
      expect(page).to have_content(lesson.name)

      find("[data-test=\"delete-lesson-#{lesson.id}\"]").click

      expect(page).not_to have_content(lesson.name)
    end

    scenario 'from lesson dashboard' do
      visit team_lesson_path(team_id: team.id, id: lesson.id)

      click_on('Delete Lesson')

      expect(page).to have_content('Create a Lesson')
      expect(page).not_to have_content(lesson.name)
    end
  end
end