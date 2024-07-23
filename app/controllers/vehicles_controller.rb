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

    private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:name, :category, :seats, :speed, :price_per_day, :description, :location, :availability, :photo)
    end
end
