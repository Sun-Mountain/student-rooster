# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'read and delete lessons' do
  let(:user) { create(:user) }
  let!(:team) { create(:team, name: 'My Team') }
  let!(:team_ownership) { create(:team_ownership, team_id: team.id, user_id: user.id) }
  let!(:lesson) { create(:lesson, title: 'Lesson1', team_id: team.id) }
  let!(:session) { create(:session, name: 'Session1', lesson_id: lesson.id) }

  before(:each) do
    sign_in(user)
    visit team_lesson_path(team.id, lesson.id)
  end

  context 'when successful' do
    scenario 'owner visits session page' do
      expect(page).to have_content('My Team')
      expect(page).to have_css('h2', text: 'Lesson1')
      
      find("[data-test=\"view-session-#{session.id}\"]").click

      expect(page).to have_css('h3', text: 'Session1')
    end

    scenario 'owner deletes a lesson' do
      delete_session = create(:session, name: 'Delete This Session', lesson_id: lesson.id)

      visit team_lesson_path(team.id, lesson.id)

      expect(page).to have_content('Delete This Session')
      
      find("[data-test=\"delete-session-#{delete_session.id}\"]").click

      expect(page).to have_content('Session was successfully destroyed.')

      expect(page).to_not have_content('Delete This Session')
    end
  end
end
