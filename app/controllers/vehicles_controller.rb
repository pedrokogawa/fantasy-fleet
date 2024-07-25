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

        if params[:search].present?
          @vehicles = Vehicle.where("name ILIKE ? OR category ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
        else
          @vehicles = Vehicle.all
        end

        if params[:category].present?
          @vehicles = @vehicles.where(category: params[:category])
        end

        if params[:seats].present?
          seats = params[:seats].to_i
          @vehicles = @vehicles.where(seats: seats) if seats > 0
        end

        if params[:price_min].present?
          price_min = params[:price_min].to_i
          @vehicles = @vehicles.where("price_per_day >= ?", price_min) if price_min >= 0
        end

        if params[:price_max].present?
          price_max = params[:price_max].to_i
          @vehicles = @vehicles.where("price_per_day <= ?", price_max) if price_max > 0
        end

        if params[:speed_min].present?
          speed_min = params[:speed_min].to_i
          @vehicles = @vehicles.where("speed >= ?", speed_min) if speed_min >= 0
        end

        if params[:speed_max].present?
          speed_max = params[:speed_max].to_i
          @vehicles = @vehicles.where("speed <= ?", speed_max) if speed_max > 0
        end

        if params[:location].present?
          @vehicles = @vehicles.where("location ILIKE ?", "%#{params[:location]}%")
        end
    end

    # show has @vehicle ~ test OK
    def show
        @booking = Booking.new
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
