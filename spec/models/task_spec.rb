# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }
  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:description).of_type(String) }
  it { is_expected.to have_field(:due_date).of_type(Date) }
  it { is_expected.to have_field(:code).of_type(String) }
  it { is_expected.to have_many :participating_users }
  it { is_expected.to belong_to :owner }
  it { is_expected.to belong_to :category }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name) }

  describe '#save' do
    context 'with params from scratch' do
      let(:owner) { create :user }
      let(:category) { create :category }
      let(:participant_1) { build :participant, :responsible }
      let(:participant_2) { build :participant, :follower }

      subject(:task) do
        described_class.new(
          name: 'Mi tarea',
          description: 'desc',
          due_date: Date.today + 5.days,
          category: category,
          owner: owner,
          participating_users: [participant_1, participant_2]
        )
      end

      it { is_expected.to be_valid }
      context 'after save' do
        before(:each) { task.save }

        it { is_expected.to be_persisted }

        it 'has a computed code' do
          expect(task.code).to be_present
        end
      end
      context 'with due_date in the past' do
        subject { task.tap { |t| t.due_date = Date.today - 1.day } }

        it { is_expected.to_not be_valid }
      end
    end
    context 'with params from FactoryBot' do
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
end
