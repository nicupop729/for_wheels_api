class UsersController < ApplicationController
  def index
    @users = User.all
    render json: { status: 'OK', message: 'Users are here', data: @users }, status: :ok
  end

  def log_in
    user = User.where(name: params[:name])
    render json: { status: 'OK', message: 'User found', data: user }, status: :ok
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      render status: 201, json: {
        status: 'OK',
        message: 'New user created'
      }
    else
      render json: { errors: new_user.errors,
                     status: 422 }, status: 422
    end
  end

  private

  def user_params
    params.permit(:name)
  end
end
