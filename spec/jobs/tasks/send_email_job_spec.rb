require 'rails_helper'

RSpec.describe Tasks::SendEmailJob, type: :job do
  describe '#perform_async' do
    let(:task_id) { '1' }

    it 'sends the email' do
      task = class_double('Task').as_stubbed_const
      service = double
      object_double('Tasks::SendEmail', new: service).as_stubbed_const

      expect(task).to receive(:find).with(task_id)
      expect(service).to receive(:call)

      described_class.perform_async task_id
    end
  end
end
