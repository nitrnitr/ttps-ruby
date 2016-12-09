class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:create]
  skip_before_action :verify_authenticity_token

  def create
    task = Task.new task_params
    task.percentage = 0 if task.type == 'LongTask'
    task.list = @list

    if task.valid?
      task.save
      redirect_to "/lists/#{task.list.slug}", notice: 'Task created'
    else
      throw task.errors
      redirect_to "/lists/#{task.list.slug}", notice: 'Task could not be created'
    end
  end

  def update
    if @task.update(task_params)
      redirect_to "/lists/#{@task.list.slug}/", notice: 'Task was successfully updated.'
    else
      @task = @task.becomes(Task)
      @list = List.find_by(slug: params[:list_id])
      @type = @task.type

      render :edit
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      redirect_to list_path(@task.list.path), notice: 'Task was successfully destroyed.'
    end
  end

  private
  def set_list
    @list = List.find_by(slug: params[:list_id] || params[:id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :percentage, :type, :start_date, :end_date)
  end
end
