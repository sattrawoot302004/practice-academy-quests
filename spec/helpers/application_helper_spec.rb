require 'rails_helper'


RSpec.describe ApplicationHelper, type: :helper do
  describe "#task_complete_class" do
    let(:completed_task) { double("Task", completed: true) }
    let(:incomplete_task) { double("Task", completed: false) }

    it "returns the correct class for completed task" do
      expect(helper.task_complete_class(completed_task)).to eq("line-through text-gray-400")
    end

    it "returns nil for incomplete task" do
      expect(helper.task_complete_class(incomplete_task)).to be_nil
    end
  end
end
