require 'rails_helper'

RSpec.describe Roster, type: :model do
  subject { create :roster }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#name' do
    it 'does not require a name' do
      subject.name = nil
      expect(subject).to be_valid
    end
  end

  describe '#begin_date' do
    it 'requires a begin_date' do
      subject.begin_date = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#end_date' do
    it 'requires a end_date' do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end
  end
end
