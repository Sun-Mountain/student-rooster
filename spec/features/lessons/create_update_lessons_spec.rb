# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'create and update lesson' do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
    visit root_path
    team = create(:team, name: 'Team1')
    create(:team_ownership, team_id: team.id, user_id: user.id)
    visit team_path(team.id)
  end

  context 'when successful' do
    scenario 'user creates first lesson' do
      expect(page).to have_content('Team1')
      expect(page).to have_content('Create your first lesson here.')

      click_link('here')

      expect(page).to have_content('New Lesson')

      fill_in('Title', with: 'Lesson1')
      click_button('Create Lesson')

      expect(page).to have_content('Lesson was successfully created.')
      expect(page).to have_content('Lesson1')
    end

    scenario 'user updates a lesson' do
      expect(page).to have_content('Team1')
      expect(page).to have_content('Create your first lesson here.')

      click_link('here')

      expect(page).to have_content('New Lesson')

      fill_in('Title', with: 'Lesson1')
      click_button('Create Lesson')

      expect(page).to have_content('Lesson was successfully created.')
      expect(page).to have_content('Lesson1')

      click_link('Lesson1')

      expect(page).to have_content('Edit Lesson')

      click_link('Edit Lesson')

      expect(page).to have_content('Edit Lesson')

      fill_in('lesson[title]', with: 'Lesson2')
      click_button('Save')

      expect(page).to have_content('Lesson was successfully updated.')
      expect(page).to_not have_content('Lesson1')
      expect(page).to have_content('Lesson2')
    end
  end

  context 'when unsuccessful' do
    scenario 'user creates a lesson without a title' do
      expect(page).to have_content('Team1')
      expect(page).to have_content('Create your first lesson here.')

      click_link('here')

      expect(page).to have_content('New Lesson')

      fill_in('Title', with: '')
      click_button('Create Lesson')

      expect(page).to have_content('Lesson could not be created: Title can\'t be blank.')
    end

    scenario 'user updates a lesson without a title' do
      expect(page).to have_content('Team1')
      expect(page).to have_content('Create your first lesson here.')

      click_link('here')

      expect(page).to have_content('New Lesson')

      fill_in('Title', with: 'Lesson1')
      click_button('Create Lesson')

      expect(page).to have_content('Lesson was successfully created.')
      expect(page).to have_content('Lesson1')

      click_link('Lesson1')

      expect(page).to have_content('Edit Lesson')

      click_link('Edit Lesson')

      expect(page).to have_content('Edit Lesson:')

      fill_in('lesson[title]', with: '')
      click_button('Save')

      expect(page).to have_content('Lesson could not be updated: Title can\'t be blank.')
    end
  end
end
