# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user creates account' do
  before(:each) do
    visit new_user_session_path
    click_link 'sign-up'
  end

  context 'success:' do
    scenario 'user creates an account' do
      fill_in :user_username, with: 'CapPicard'
      fill_in :user_email, with: 'picard@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'

      click_on('Sign up')

      expect(page).to have_content('Welcome CapPicard')
    end
  end

  context 'fail:' do
    scenario 'when missing required fields' do
      click_on('Sign up')

      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Username can't be blank")
    end
  end
end