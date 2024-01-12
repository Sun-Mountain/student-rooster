# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'new user signs up for account' do
  include MailerHelper

  before(:each) do
    visit new_user_registration_path
  end

  context 'when successful' do
    before(:each) do
      fill_in :user_username, with: 'Vimes'
      fill_in :user_email, with: 'vimes@gmail.com'
      fill_in :user_password, with: '3veryDay#P0tato'
      fill_in :user_password_confirmation, with: '3veryDay#P0tato'

      click_on('Sign up')
    end

    scenario 'the email entered in to our job queue' do
      expect(ActionMailer::Base.deliveries.count).to eq(1)

      visit new_user_registration_path
      fill_in :user_username, with: 'Angua'
      fill_in :user_email, with: 'angua@gmail.com'
      fill_in :user_password, with: '3veryDay#P0tato'
      fill_in :user_password_confirmation, with: '3veryDay#P0tato'
      
      click_on('Sign up')

      expect(ActionMailer::Base.deliveries.count).to eq(2)
    end

    scenario 'user sent a confirmation email with confirmation token' do
      Sidekiq::Worker.drain_all
      expect(:confirmation_token).to be_present

      ctoken = last_email.body.match(/confirmation_token=[^"]*/)

      expect(ctoken).to be_present
    end

    scenario 'user clicks on confirmation link to navigate to portal' do
      Sidekiq::Worker.drain_all

      last_delivery = ActionMailer::Base.deliveries.last
  
      confirmation_link = last_delivery.body.raw_source.match(%r{href="http:\/\/localhost:3500(?<path>.+?)">})[:path]

      visit confirmation_link

      expect(page).to have_http_status(200)
    end
  end

  # context 'when missing required fields on form' do
  #   scenario 'returns to the log in page with error messages' do
  #     click_on('Sign up')

  #     expect(page).to have_content("Email can't be blank")
  #     expect(page).to have_content("Email is invalid")
  #     expect(page).to have_content("Password can't be blank")
  #     expect(page).to have_content("First name can't be blank")
  #     expect(page).to have_content("Last name can't be blank")
  #     expect(page).to have_content("Implementer can't be blank")
  #     expect(page).to have_content('Password must include at least one number, one lowercase letter, one uppercase letter, and one special character (!@#$&*-)')
  #     expect(page).to have_content('Agree to terms you must agree to the terms of service to create an account')
  #   end
  # end

  context 'when using an email already registered' do
    scenario 'returns to the sign in page with error' do
      create(:user, email: 'vimes@gmail.com')

      fill_in :user_username, with: 'Samuel'
      fill_in :user_email, with: 'vimes@gmail.com'
      fill_in :user_password, with: '3veryDay#P0tato'
      fill_in :user_password_confirmation, with: '3veryDay#P0tato'

      click_on('Sign up')

      expect(page).to have_content('Email has already been taken')
    end
  end

  context 'when a user has not verified their email' do
    scenario 'unverified user tries and fails to sign in' do
      Sidekiq::Worker.drain_all

      unconfirmed = create(:user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!', confirmed_at: nil)

      visit new_user_session_path

      fill_in 'user_email', with: unconfirmed.email
      fill_in 'user_password', with: '12345ABCDEfghi!'

      find('[data-test="submit"]').click

      expect(unconfirmed.confirmed_at).to be_nil
      expect(page).to have_content('Log in')
    end
  end
end
