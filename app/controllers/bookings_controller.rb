class BookingsController < ApplicationController
    before_action :set_booking, only: [:show]

    # index is at /boookings ~ test OK
    def index
        @bookings = Booking.all
    end

    def show
    end

    def new
    end

    def create
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
      
    end
end
