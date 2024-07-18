class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :cancel]

    # index is at /boookings ~ test OK
    #filtered with bookings created by the user only
    def index
        @bookings = Booking.all.where(user_id: current_user.id)
    end

    def show
        
    end

    #new form is at /bookings/new ~ test OK
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

    #edit form is at /bookings/:id/edit ~ test OK
    def edit
    end

    def update
        if @booking.update(booking_params)
            @booking.total_price_calculation
            @booking.save
            redirect_to booking_path(@booking), notice: 'Booking successfully updated!'
        else
            render :edit
        end
    end

    #canceling is at /bookings/:id/cancel ~ test OK
    #this ONLY sets up the status on CANCEL
    def cancel
        @booking.canceled!
        if @booking.save
            redirect_to booking_path(@booking), notice: 'Booking successfully canceled!'
        else
            redirect_to booking_path(@booking), alert: 'Failed to cancel the booking!'
        end
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :total_price, :status, :vehicle_id)
    end
end
