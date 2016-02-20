class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def create
  	@project   = Project.find(params[:project_id])
  	@task      = @project.tasks.build(tasks_params)
  	@task.user = current_user
  	@task.save

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
    end

  	

  end

  def destroy
  	@project = Project.find(params[:project_id])
  	@task    = @project.tasks.find(params[:id]).destroy

  	respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
    end

  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @task.update(tasks_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def sort
    params[:task].each_with_index do |id, index|
      @project = Project.find(params[:project_id])
      @task    = @project.tasks.find(id)
      @task.update( { position: index + 1 } )
    end
    render nothing: true
  end

  def status
    @project = Project.find(params[:project_id])
    @task    = @project.tasks.find(params[:id])
    @task.update( { status: params[:status] } )
    render nothing: true
  end

  private

  def set_task
      @project = Project.find(params[:project_id])
      @task    = @project.tasks.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:name, :status, :position, :deadline)
  end

end