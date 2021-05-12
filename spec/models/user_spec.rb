# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create :user }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#username' do
    it 'requires a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#full_name' do
    it 'requires a full name' do
      subject.full_name = nil
      expect(subject).to_not be_valid
    end
  end
end