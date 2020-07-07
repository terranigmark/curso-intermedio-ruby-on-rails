# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#save' do
    let(:participants_count) { 4 }
    subject(:task) { build(:task_with_participants, participants_count: participants_count) }

    it 'is persisted' do
      expect(task.save).to eq true
    end

    context 'after save' do
      before(:each) { task.save }

      it 'has all associated participants' do
        expect(task.participating_users.count).to eq participants_count
        expect(Participant.count).to eq participants_count
      end
    end
  end
end
