class BookingsController < ApplicationController

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
end
