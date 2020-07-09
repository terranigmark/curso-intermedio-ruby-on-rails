require 'rails_helper'

RSpec.describe Tasks::SendEmail do
  let(:participants_count) { 4 }
  let(:task) { build(:task_with_participants, participants_count: participants_count) }

  subject(:service) { described_class.new }

  describe '#call' do
    context 'with a valid task' do
      before(:each) { task.save }

      it 'should return success' do
        success, message = service.call task
        expect(success).to eq true
        expect(message).to eq 'successful'
      end
    end

    context 'with a nil task' do
      it 'should return failed' do
        success, message = service.call nil
        expect(success).to eq false
        expect(message).to eq 'failed'
      end
    end
  end
end
