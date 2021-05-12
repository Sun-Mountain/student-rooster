# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'create and edit teams' do
  let!(:user) { create :user }

  before(:each) do
    sign_in user
    visit root_path
  end

  context 'success' do
    scenario 'new user creates and edits first team' do
      expect(page).to have_content('Create Your Team')

      fill_in :team_name, with: 'Enterprise'

      find('[data-test="create-new-team"]').click

      expect(page).to have_content('Create your first Lesson!')

      team = user.teams.first

      visit edit_team_path(team)

      expect(page).to have_content('Edit team')
    end
  end
end