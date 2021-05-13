# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user edits profile' do
  let(:user) { create :user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!' }

  before(:each) do
    sign_in user
    visit edit_user_registration_path
  end

  context 'success' do
    scenario 'change username and name' do
      fill_in :user_username, with: 'CapPicard'
      fill_in :user_current_password, with: '12345ABCDEfghi!'

      find('[data-test="update-user-account"]').click

      expect(page.body).to have_content('Your account has been updated successfully.')
    end

    scenario 'change password' do
      new_password = 'new_password'

      fill_in 'user_password', with: new_password
      fill_in 'user_password_confirmation', with: new_password
      fill_in 'user_current_password', with: '12345ABCDEfghi!'

      find('[data-test="update-user-account"]').click

      expect(page.body).to have_content('Your account has been updated successfully.')

      sign_out user

      visit new_user_session_path

      fill_in 'user_email', with: user.password
      fill_in 'user_password', with: '12345ABCDEfghi!'
      find('[data-test="submit"]').click
    end
  end
end