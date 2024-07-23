class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    # //root page// has @vehicles ~ test OK 
    def index
        @vehicles = Vehicle.all
        @markers = @vehicles.geocoded.map do |vehicle|
            {
            lat: vehicle.latitude,
            lng: vehicle.longitude,
            info_window_html: render_to_string(partial: "info_window", locals: {vehicle: vehicle})
            }
        end
    end
    
    # show has @vehicle ~ test OK 
    def show
        @booking = Booking.new
        @reviews = @vehicle.reviews
        @review = Review.new
        @current_user_id = current_user.id
        @average_rating = average_rating_calculation(@vehicle)
        @reviews_size = @reviews.size
            # Calculate the sizes for each rating
        @rating_1 = @reviews_size.zero? ? 0 : (@reviews.where(rating: 1).size * 100 / @reviews_size).round
        @rating_2 = @reviews_size.zero? ? 0 : (@reviews.where(rating: 2).size * 100 / @reviews_size).round
        @rating_3 = @reviews_size.zero? ? 0 : (@reviews.where(rating: 3).size * 100 / @reviews_size).round
        @rating_4 = @reviews_size.zero? ? 0 : (@reviews.where(rating: 4).size * 100 / @reviews_size).round
        @rating_5 = @reviews_size.zero? ? 0 : (@reviews.where(rating: 5).size * 100 / @reviews_size).round
    end

    # new has @vehicle ~ test OK 
    def new
        @vehicle = Vehicle.new
    end   
    
    def create
        @vehicle = Vehicle.new(vehicle_params)
        @vehicle.user_id = current_user.id
        
        if @vehicle.save
            redirect_to vehicle_path(@vehicle)
        else
            render :new
        end
    end

    # edit has @vehicle and can update ~ test OK 
    def edit
    end    
    
    def update
        @vehicle.update(vehicle_params)
        redirect_to vehicle_path
    end

    # destory has @vehicle and can DESTROY ~ test OK 
    def destroy
        @vehicle.destroy
        redirect_to vehicles_path, status: :see_other
    end

    # automatically calculate AVERAGE RATING on all reviews
    def average_rating_calculation(vehicle)
        reviews = vehicle.reviews
        return 0 if reviews.empty?

        total_rating = reviews.sum(:rating)
        average_rating = total_rating.to_f / reviews.size
        average_rating.round(1)
    end

    private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:name, :category, :seats, :speed, :price_per_day, :description, :location, :availability, :photo)
    end
end
