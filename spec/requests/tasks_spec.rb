require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { create :user }
  before(:each) { sign_in user }
  describe "GET /tasks" do
    it "works! (now write some real specs)" do
      get tasks_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /tasks/new" do
    it "works! (now write some real specs)" do
      get new_task_path
      expect(response).to render_template(:new)
    end
  end
end
