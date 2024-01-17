# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user signs in' do
  scenario 'when successful' do
    user = create(:user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!')

    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: '12345ABCDEfghi!'

    find('[data-test="submit"]').click

    expect(page).to have_content('Dashboard')
  end

  scenario 'user cannot sign in if account not confirmed' do
    unconfirmed = create(:user, password: '12345ABCDEfghi!', password_confirmation: '12345ABCDEfghi!',
                                confirmed_at: nil)

    visit new_user_session_path
    fill_in 'user_email', with: unconfirmed.email
    fill_in 'user_password', with: '12345ABCDEfghi!'
    find('[data-test="submit"]').click

    expect(page.body).to include('You have to confirm your email address before continuing.')

    fill_in 'user_email', with: unconfirmed.email

    expect(ActionMailer::Base.deliveries.count).to eq(1)

    last_delivery = ActionMailer::Base.deliveries.last

    confirmation_link = last_delivery.body.raw_source.match(%r{href="http://localhost:3500(?<path>.+?)">})[:path]

    visit confirmation_link
    visit new_user_session_path

    fill_in 'user_email', with: unconfirmed.email
    fill_in 'user_password', with: '12345ABCDEfghi!'

    find('[data-test="submit"]').click

    expect(page.body).to include('Dashboard')
  end
end
