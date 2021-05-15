# frozen_string_literal: true

RSpec.feature 'creating rosters' do
  let!(:user) { create :user }

  before(:each) do
    sign_in user
    visit root_path
  end
end
