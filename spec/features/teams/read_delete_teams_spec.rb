# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'read and delete teams' do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
    visit root_path
  end

  context 'when successful' do
    scenario 'owner visits team page' do
      team = create(:team, name: 'Team1')
      create(:team_ownership, team_id: team.id, user_id: user.id)

      visit team_path(team.id)

      expect(page).to have_content('Team1')
      expect(page).to have_content("Owner: #{user.email}")
      expect(page).to have_content('Edit Team')
    end

    scenario 'user deletes a team' do
      team = create(:team, name: 'Team1')
      create(:team_ownership, team_id: team.id, user_id: user.id)

      visit root_path

      expect(page).to have_content('Team1')

      click_link('Team1')

      expect(page).to have_content('Edit Team')

      click_link('Edit Team')

      expect(page).to have_content('Edit:')
      click_button('Delete')
      
      expect(page).to have_content('Team was successfully destroyed.')
      expect(page).to have_content('Dashboard')
      expect(page).to_not have_content('Team1')
    end
  end
end
