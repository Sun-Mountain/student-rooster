# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'read and delete lessons' do
  let(:user) { create(:user) }
  let!(:team) { create(:team, name: 'My Team') }
  let!(:team_ownership) { create(:team_ownership, team_id: team.id, user_id: user.id) }
  let!(:lesson) { create(:lesson, title: 'Lesson1', team_id: team.id) }

  before(:each) do
    sign_in(user)
    visit team_path(team.id)
  end

  context 'when successful' do
    scenario 'owner visits lesson page' do
      expect(page).to have_content('My Team')
      expect(page).to have_content('Lesson1')
      expect(page).to_not have_css('h2', text: 'Lesson1')

      click_link('Lesson1')

      expect(page).to have_css('h2', text: 'Lesson1')
      expect(page).to have_content('Edit Lesson')
      expect(page).to have_content('Back to Team')
    end

    scenario 'user deletes a lesson' do
      lesson = create(:lesson, title: 'Delete This Lesson', team_id: team.id)

      visit team_path(team.id)

      expect(page).to have_content('Delete This Lesson')
      
      click_link('Delete This Lesson')

      expect(page).to have_content('Edit Lesson')
      click_link('Edit Lesson')
      click_button('Delete')

      expect(page).to have_content('Lesson was successfully destroyed.')
      expect(page).to_not have_content('Delete This Lesson')
    end
  end
end
