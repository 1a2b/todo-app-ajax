class TasksController < ApplicationController

  before_action :find_task, :only => [:update, :edit, :done, :destroy]

  def new
    @task = Task.new
  end
   
  def create
    @list = List.find(params[:task][:list_id])
    @task = @list.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to lists_path }
        format.js   { }
      end
    end
  end


   def update
    @task.update(task_params)

    respond_to do |format|
      format.html { redirect_to lists_path }
      format.js {}
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end


  def done
      if @task.completed
        @task.update_attribute(:completed,false)
      elsif !@task.completed
        @task.update_attribute(:completed,true)
      end

      respond_to do |format|
        format.html { redirect_to lists_path}
        format.js   {}
      end
  end

  def destroy
  
    @task.destroy
    respond_to do |format|
      format.html { redirect_to lists_path }
      format.js   {}
    end
  end

  private

    def task_params
      params.require(:task).permit(:content, :completed, :list_id)
    end

    def find_task
          @task = Task.find_by(id: params[:id])
    end
end