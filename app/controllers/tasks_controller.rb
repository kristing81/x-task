class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Your task was created"
      redirect_to tasks_path
    else
      flash[:error] = "There was a complication saving your task.  Please try again"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Your task was destroyed"
    else
      flash[:error] = "Your task is still here.  Try destroying again"
    end
    redirect_to tasks_path 
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
