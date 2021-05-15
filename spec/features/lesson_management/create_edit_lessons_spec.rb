# frozen_string_literal: true

RSpec.feature 'creating and updating lessons' do
  let!(:user) { create :user }
  let!(:team) { create :team }
  let!(:lesson) { create :lesson }

  before(:each) do
    user.teams << team
    sign_in user
    visit root_path
  end

  context 'success' do
    scenario 'create, read, and edit lesson' do
      quantum = 'Quantum Physics 101'

      expect(page).to have_content("No lessons exist for #{team.name}")
      expect(page).to have_content("Create a Lesson")

      fill_in :lesson_name, with: quantum

      find('[data-test="create-lesson"]').click

      expect(page).to have_content(quantum)

      click_on("#{quantum}")

      expect(page).to have_content(quantum)
      expect(page).to have_content('Add Description')

      click_on('Add Description')

      expect(page).to have_content('Edit Lesson')

      fill_in :lesson_description, with: "For those smarter than the smarties."

      find('[data-test="submit"]').click

      expect(page).to have_content('Lesson updated.')
      expect(page).to have_content("For those smarter than the smarties.")
    end
  end

  context 'fail' do
    scenario 'cannot create lesson' do
      expect(page).to have_content("Create a Lesson")

      fill_in :lesson_name, with: ''

      find('[data-test="create-lesson"]').click

      expect(page).to have_content("Lesson could not be created: Name can't be blank")
    end

    scenario 'cannot edit lesson' do
      team.lessons << lesson

      visit edit_team_lesson_path(team_id: team.id, id: lesson.id)

      expect(page).to have_content('Edit Lesson')

      fill_in :lesson_name, with: ''

      find('[data-test="submit"]').click

      expect(page).to have_content("Lesson could not be updated: Name can't be blank")
    end
  end
end
