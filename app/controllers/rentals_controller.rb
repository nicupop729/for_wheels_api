class RentalsController < ApplicationController
    def index
        user = User.find(params[:user_id])
        rentals = user.rentals
        render json: { status: 'OK', message: 'Rentals are here', data: rentals }, status: :ok
    end

    def show
        user = User.find(params[:user_id])
        rental = user.rentals.find(params[:id])
        render json: { status: 'OK', message: 'Rental is here', data: rental }, status: :ok
    end

    def create
        new_rental = Rental.new(rental_params)
        if new_rental.save
            render status: 201, json: {
                status: 'OK',
                message: 'New rental created'
            }
        else
            render json: { status: 'ERROR', errors: 'Rental not created' }, status: 422
        end
    end

    def destroy
        rental = Rental.find(params[:id])
        rental.destroy
        render status: 200, json: {
            status: 'OK',
            message: 'Rental deleted'
        }
    end

    private

    def rental_params
        params.require(:rental).permit(:user_id, :car_id, :start_date, :end_date)
    end
end
