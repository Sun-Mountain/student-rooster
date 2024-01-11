# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'create and update teams' do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
    visit root_path
  end

  context 'when successful' do
    scenario 'user creates a team' do
      expect(page).to have_content('Dashboard')
      expect(page).to have_content('Create your first team here.')

      click_link('here')

      expect(page).to have_content('New Team')

      fill_in('Name', with: 'Team1')
      click_button('Create Team')

      expect(page).to have_content('Team was successfully created.')
    end

    scenario 'user updates a team' do
      team = create(:team, name: 'Team1')
      create(:team_ownership, team_id: team.id, user_id: user.id)

      visit root_path

      expect(page).to have_content('Team1')

      click_link('Team1')

      expect(page).to have_content('Edit Team')

      click_link('Edit Team')

      expect(page).to have_content('Edit:')

      fill_in('team[name]', with: 'Team2')
      click_button('Save')

      expect(page).to have_content('Team was successfully updated.')
      expect(page).to_not have_content('Team1')
      expect(page).to have_content('Team2')
    end
  end

  context 'when unsuccessful' do
    scenario 'user creates a team without a name' do
      expect(page).to have_content('Dashboard')
      expect(page).to have_content('Create your first team here.')

      click_link('here')

      expect(page).to have_content('New Team')

      click_button('Create Team')

      expect(page).to have_content("Team could not be created: Name can't be blank.")

      fill_in('Name', with: 'Team1')
      click_button('Create Team')

      expect(page).to have_content('Team was successfully created.')
    end

    scenario 'user updates a team without a name' do
      team = create(:team, name: 'Team1')
      create(:team_ownership, team_id: team.id, user_id: user.id)

      visit root_path

      expect(page).to have_content('Team1')

      click_link('Team1')

      expect(page).to have_content('Edit Team')

      click_link('Edit Team')

      expect(page).to have_content('Edit:')

      fill_in('team[name]', with: '')
      click_button('Save')

      expect(page).to have_content("Team could not be updated: Name can't be blank.")

      fill_in('team[name]', with: 'Team2')
      click_button('Save')

      expect(page).to have_content('Team was successfully updated.')
      expect(page).to_not have_content('Team1')
      expect(page).to have_content('Team2')
    end
  end
end
