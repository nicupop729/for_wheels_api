class RentalsController < ApplicationController
  before_action :set_rental, only: [:destroy]

  def index
    user = User.find(params[:user_id])
    rentals = user.rentals.order(start_date: :asc)
    render json: { status: 'OK', message: 'Rentals are here', data: rentals }.to_json, status: :ok
  end

  def show
    rental = Rental.find(params[:id])
    render json: { status: 'OK', message: 'Rental is here', data: rental }.to_json, status: :ok
  end

  def create
    new_rental = Rental.new(rental_params)
    if new_rental.save
      render status: 201, json: {
        status: 'OK',
        message: 'New rental created'
      }.to_json
    else
      render json: { status: 'ERROR', errors: 'Rental not created' }, status: 422
    end
  end

  def destroy
    @rental.destroy
    render status: 200, json: {
      status: 'OK',
      message: 'Car rental cancelled successfully'
    }.to_json
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:user_id, :car_id, :start_date, :end_date, :price)
  end
end
