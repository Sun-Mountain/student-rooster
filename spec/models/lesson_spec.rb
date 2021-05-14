# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lesson, type: :model do
  subject { create :lesson }

  describe 'factory' do
    it { is_expected.to be_valid }
  end

  describe '#name' do
    it 'requires a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end