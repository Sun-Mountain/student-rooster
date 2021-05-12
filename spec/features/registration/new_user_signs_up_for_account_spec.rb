# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'new user signs up for account' do
  before(:each) do
    visit new_user_session_path
    click_link 'sign-up'
  end
end