# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'create and update session' do
  let(:user) { create(:user) }
  let!(:team) { create(:team, name: 'My Team') }
  let!(:team_ownership) { create(:team_ownership, team_id: team.id, user_id: user.id) }
  let!(:lesson) { create(:lesson, title: 'Lesson1', team_id: team.id) }

  before(:each) do
    sign_in(user)
    visit team_lesson_path(team.id, lesson.id)
  end

  context 'when successful' do
    scenario 'owner creates sessions' do
      expect(page).to have_css('h2', text: 'Lesson1')

      expect(page).to have_content('Create your first session here.')

      click_link('here')

      expect(page).to have_content('Add a New Session')

      fill_in('Name', with: 'Session1')
      fill_in('Start date', with: '2017-01-01')
      fill_in('End date', with: '2017-01-31')
      click_button('Add Session')

      expect(page).to have_content('Session was successfully created.')

      expect(page).to have_content('Session1')
      expect(page).to have_content('01/01/2017')
      expect(page).to have_content('01/31/2017')

      click_link('Add a new session')

      expect(page).to have_content('Add a New Session')

      fill_in('Name', with: 'Session2')
      fill_in('Start date', with: '2017-02-01')
      fill_in('End date', with: '2017-02-28')
      click_button('Add Session')

      expect(page).to have_content('Session was successfully created.')
      expect(page).to have_content('Session2')
      expect(page).to have_content('02/01/2017')
      expect(page).to have_content('02/28/2017')
    end

    scenario 'user updates a lesson' do
      session1 = create(:session, name: 'Session1', lesson_id: lesson.id)

      visit team_lesson_path(team.id, lesson.id)

      expect(page).to have_css('h2', text: 'Lesson1')
      expect(page).to have_content('Session1')
      
      find("[data-test=\"edit-session-#{session1.id}\"]").click

      expect(page).to have_content('Edit Session:')

      fill_in('Name', with: 'Session2')
      fill_in('Start date', with: '2017-01-01')
      fill_in('End date', with: '2017-01-31')
      click_button('Update Session')

      expect(page).to have_content('Session was successfully updated.')
      expect(page).to have_content('Session2')
      expect(page).to have_content('01 January, 2017')
      expect(page).to have_content('31 January, 2017')
    end
  end

  context 'when unsuccessful' do
    scenario 'owner creates a session without a name' do
      expect(page).to have_css('h2', text: 'Lesson1')

      expect(page).to have_content('Create your first session here.')

      click_link('here')

      expect(page).to have_content('Add a New Session')

      fill_in('Name', with: '')
      fill_in('Start date', with: '2017-01-01')
      fill_in('End date', with: '2017-01-31')
      click_button('Add Session')

      expect(page).to have_content('Session could not be created: Name can\'t be blank.')
    end

    scenario 'user updates a lesson without a title' do
      session1 = create(:session, name: 'Session1', lesson_id: lesson.id)

      visit team_lesson_path(team.id, lesson.id)

      expect(page).to have_css('h2', text: 'Lesson1')
      expect(page).to have_content('Session1')
      
      find("[data-test=\"edit-session-#{session1.id}\"]").click

      expect(page).to have_content('Edit Session:')

      fill_in('Name', with: '')
      click_button('Update Session')
      
      expect(page).to have_content('Session could not be updated: Name can\'t be blank.')
    end
  end
end
