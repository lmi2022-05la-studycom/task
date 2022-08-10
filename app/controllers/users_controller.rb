class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  before_action :already_logged_in, only: [:new, :create]

  def show
    @user = current_user
    status = params[:status]
    if status.present?
      @tasks = current_user.tasks.where(status: status).order(:created_at).page(params[:page])
    else
      @tasks = current_user.tasks.all.order(:created_at).page(params[:page])
    end
    @task = Task.new
  end

  # def index1
  #   @tasks = Task.where(status: "todo").order(:created_at).page(params[:page])
  #   @user = current_user
  #   @task = Task.new
  #   render "users/show.html.erb"
  # end

  # def index2
  #   @tasks = Task.where(status: "doing")
  # end

  # def index3
  #   @tasks = Task.where(status: "done")
  # end

  # def deleteall
  #   @tasks = Task.where(status: "done")
  #   @tasks.delete_all
  #   @task = Task.new
  #   render 'users/show.html.erb'
  # end

  def destroy_all
    @tasks = current_user.tasks.where(status: 'done').destroy_all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:success] = '登録しました'
      redirect_to root_path
    else
      flash.now[:danger] = '登録できませんでした'
      render :new 
    end
  end

  private
  def user_params 
    params.require(:user).permit(:name, :birthday, :email, :password, :password_confirmation)
  end
end
