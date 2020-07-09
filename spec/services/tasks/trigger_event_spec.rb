require 'rails_helper'

RSpec.describe Tasks::TriggerEvent do
  let(:participants_count) { 4 }
  let(:task) { build(:task_with_participants, participants_count: participants_count) }

  subject(:service) { described_class.new }

  describe '#call' do
    context 'with a valid task' do
      before(:each) { task.save }

      let(:event) { 'start' }

      it 'should return success' do
        success, message = service.call task, event
        expect(success).to eq true
        expect(message).to eq 'successful'
        expect(task.status).to eq 'in_process'
        expect(task.transitions.count).to eq 1
      end
    end
  end
end
