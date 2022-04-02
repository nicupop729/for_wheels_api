class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    users = User.all
    render json: { status: 'OK', message: 'Users are here', data: users }, status: :ok
  end

  def log_in
    user = User.where(name: params[:name])
    if user.empty?
      render json: { status: 'ERROR', message: 'User not found' }, status: 404
    else
      render json: { status: 'OK', message: 'User found', data: user }, status: :ok
    end
  end

  def show
    render json: { status: 'OK', message: 'User found', data: @user }, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: 201, json: {
        status: 'OK',
        message: 'New user created'
      }
    else
      render json: { status: 'ERROR', errors: 'User name already exists' }, status: 422
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
