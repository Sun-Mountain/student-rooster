# frozen_string_literal: true

RSpec.feature 'creating and updating organizations' do
  let!(:user) { create :user }

  before(:each) do
    sign_in user
    visit root_path
  end

  context 'success' do
    scenario 'create team' do
      expect(page).to have_content('Create Your Team')

      fill_in :team_name, with: 'Enterprise'

      find('[data-test="create-team"]').click

      expect(page).to have_content('Welcome to the team!')
      expect(page).to have_content('Enterprise Dashboard')
    end
  end

  context 'fail' do
    scenario 'cannot create team' do
      expect(page).to have_content('Create Your Team')

      fill_in :team_name, with: ''

      find('[data-test="create-team"]').click

      expect(page).to have_content("Team could not be created: Name can't be blank")
    end
  end
end