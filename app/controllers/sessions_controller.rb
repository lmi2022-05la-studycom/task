class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destory]
  before_action :already_logged_in, only: [:new, :create]
  def new
    # ログイン画面を表示
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if signin(email, password)
      flash[:success] = 'ログインしました'
      redirect_to root_path
    else
      flash.now[:danger] = 'ログインできませんでした'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to signin_url
  end

  private 
  def signin(email, password)
    @user = User.find_by(email: email)
    p @user
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id 
      return true
    else
      return false
    end
  end
end
