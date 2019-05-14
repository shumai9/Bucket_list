class V1::UsersController < ApplicationController
  before_action :user_params, only: [:create, :show, :update, :destroy]
  before_action :set_user, only: [:show, :update, :destroy]
  
  def index
    @users = User.all
    render json: @users 
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.where(id: params[:id]).first
    if @user.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private
  def user_params
    if ENV['RAILS_ENV'] != 'test'
      params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password)
    end
    params.permit(:user_name, :first_name, :last_name, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
