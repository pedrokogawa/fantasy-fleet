class BookingsController < ApplicationController
    before_action :set_booking, only: [:show]

    # index is at /boookings ~ test OK
    def index
        @bookings = Booking.all
    end

    def show
    end

    #new form is at /bookings/new
    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.user_id = current_user.id
        @booking.total_price_calculation
        @booking.status = :waiting

        if @booking.save
            redirect_to booking_path(@booking)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :total_price, :status, :vehicle_id)
    end
end
