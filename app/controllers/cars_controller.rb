class CarsController < ActionController::API
    def index
        @cars = Car.all
        render json: @cars
        @cars.to_json
    end
end
