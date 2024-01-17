# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'site admin dashboard' do
  context 'when successful' do
    scenario 'site admin visits site admin dashboard' do
      site_admin = create(:user, role: 'siteAdmin')
      sign_in(site_admin)

      visit admin_index_path

      expect(page).to have_content('Admin Dashboard')
      expect(page).to have_content('Users')
      expect(page).to have_content('Teams')
    end
  end

  context 'when unsuccessful' do
  end
end
