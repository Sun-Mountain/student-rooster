require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { create :student }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#first_name' do
    it 'requires a first_name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#last_name' do
    it 'requires a last_name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#contact' do
    it 'requires a contact' do
      subject.contact = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'team' do
    it 'requires a team' do
      subject.team = nil
      expect(subject).to_not be_valid
    end
  end
end
