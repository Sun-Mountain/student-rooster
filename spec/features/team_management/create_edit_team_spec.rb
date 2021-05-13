# frozen_string_literal: true

RSpec.feature 'creating and updating teams' do
  let!(:user) { create :user }
  let!(:team) { create :team }

  before(:each) do
    sign_in user
    visit root_path
  end

  context 'success' do
    scenario 'create & edit team' do
      expect(page).to have_content('Create Your Team')

      fill_in :team_name, with: 'Enterprise'

      find('[data-test="create-team"]').click

      expect(page).to have_content('Welcome to the team!')
      expect(page).to have_content('Enterprise Dashboard')

      find('[data-test="edit-team"]').click

      expect(page).to have_content('Edit Team')

      fill_in :team_name, with: 'Enterprising'

      find('[data-test="submit"]').click

      expect(page).to have_content('Enterprising Dashboard')
    end
  end

  context 'fail' do
    scenario 'cannot create team' do
      expect(page).to have_content('Create Your Team')

      fill_in :team_name, with: ''

      find('[data-test="create-team"]').click

      expect(page).to have_content("Team could not be created: Name can't be blank")
    end

    scenario 'cannot edit team' do
      visit edit_team_path(team)

      fill_in :team_name, with: ''

      find('[data-test="submit"]').click

      expect(page).to have_content("Team could not be updated: Name can't be blank")
    end
  end
end