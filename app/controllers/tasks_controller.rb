class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
    @tasks = Task.order(created_at: :asc)
  end

    def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task created!"
    else
      @tasks = Task.all
      render :index, status: :unprocessable_entity
    end
    end

 def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to tasks_path
 end

  def update
  @task = Task.find(params[:id])
  @task.update(completed: params[:completed])
  redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end
end
