class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    # //root page// has @vehicles ~ test OK
    CATEGORY_IMAGES = {
    'Car' => 'https://tork.buzz/__export/1718370996032/sites/tork/img/2024/06/14/image_10.png_1203501776.png',
    'Bicycle' => 'https://tork.buzz/__export/1718370996032/sites/tork/img/2024/06/14/image_10.png_1203501776.png',
    'ATV' => 'https://tork.buzz/__export/1718370996032/sites/tork/img/2024/06/14/image_10.png_1203501776.png',
    'Truck' => 'https://tork.buzz/__export/1718370996032/sites/tork/img/2024/06/14/image_10.png_1203501776.png',
    'Van' => 'https://tork.buzz/__export/1718370996032/sites/tork/img/2024/06/14/image_10.png_1203501776.png',
    'Boat' => 'https://tork.buzz/__export/1718370996032/sites/tork/img/2024/06/14/image_10.png_1203501776.png',
    'Airplane' => 'https://tork.buzz/__export/1718370996032/sites/tork/img/2024/06/14/image_10.png_1203501776.png',
    'Spaceship' => 'https://tork.buzz/__export/1718370996032/sites/tork/img/2024/06/14/image_10.png_1203501776.png'
    }.freeze

    def index
        @vehicles = Vehicle.all
        @markers = @vehicles.geocoded.map do |vehicle|
            {
            lat: vehicle.latitude,
            lng: vehicle.longitude,
            info_window_html: render_to_string(partial: "info_window", locals: {vehicle: vehicle})
            }
        end
        @categories = @vehicles.distinct.pluck(:category)
        @category_images = CATEGORY_IMAGES
    end

    def all
      @vehicles = Vehicle.all
    end

    def category
      @category = params[:category]
      @vehicles = Vehicle.where(category: @category)
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
