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
  describe "POST /tasks" do
    let(:category) { create :category }
    let(:participant) { create :user }
    let(:params) do
      {
        "task"=>{
          "name"=>"test 7",
          "due_date"=> Date.today + 5.days,
          "category_id"=> category.id.to_s,
          "description"=>"test",
          "participating_users_attributes" => {
            "0"=>{
              "user_id"=> participant.id.to_s,
              "role"=>"1",
              "_destroy"=>"false"
              }
            }
          }
      }
    end

    it 'creates a new task and redirect to show page' do
      post '/tasks', params: params

      expect(response).to redirect_to(assigns(:task))
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include('Task was successfully created.')
    end
  end
end
