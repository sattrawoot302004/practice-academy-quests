require 'rails_helper'

RSpec.describe "/tasks", type: :request do
  let(:valid_attributes) do
    { title: "Valid Task Title" }
  end

  let(:invalid_attributes) do
    { title: "" }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Task.create! valid_attributes
      get tasks_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Task" do
        expect {
          post tasks_url, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the tasks list" do
        post tasks_url, params: { task: valid_attributes }
        expect(response).to redirect_to(tasks_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Task" do
        expect {
          post tasks_url, params: { task: invalid_attributes }
        }.not_to change(Task, :count)
      end

      it "renders a response with 422 status" do
        post tasks_url, params: { task: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    it "updates the requested task's completed status" do
      task = Task.create! valid_attributes
      patch update_task_url(task), params: { completed: true }
      task.reload
      expect(task.completed).to eq(true)
      expect(response).to redirect_to(tasks_url)
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested task" do
      task = Task.create! valid_attributes
      expect {
        delete delete_task_url(task)
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      task = Task.create! valid_attributes
      delete delete_task_url(task)
      expect(response).to redirect_to(tasks_url)
    end
  end
end
