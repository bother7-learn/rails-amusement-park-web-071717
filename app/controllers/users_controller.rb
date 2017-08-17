class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :update, :edit]
  before_action :is_authenticated?, except: [:new, :create]

  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
  end

  private
  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:height, :happiness, :name, :nausea, :tickets, :password, :admin)
  end

end
