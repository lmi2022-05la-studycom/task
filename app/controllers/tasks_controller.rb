class TasksController < ApplicationController
  before_action :require_logged_in 
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @tasks = Tasks.all 
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create 
    @task = current_user.tasks.build(task_params)
    if @task.save 
      flash[:succes] = '登録しました'
      redirect_to root_path 
    else
      flash.now[:danger] = '登録できませんでした'
      render :new 
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def update 
    if @task.update(task_params)
      flash[:success] = '更新しました'
      redirect_to root_path
    else
      flash.now[:danger] = '更新できませんでした'
      render :edit 
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = '削除しました'
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:content, :status)
  end
  def set_task
    @task = Task.find(params[:id])
  end
  def correct_user 
    unless @task.user_id == current_user.id 
      redirect_to root_path
    end
  end
  
end
