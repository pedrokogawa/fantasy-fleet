class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :cancel]

    # index is at /boookings ~ test OK
    #filtered with bookings created by the user only
    def index
        @bookings = Booking.all.where(user_id: current_user.id)
    end

    def show
      @vehicle = @booking.vehicle
      @review = Review.new
      @average_rating = average_rating_calculation(@vehicle)
      @current_user_id = current_user.id
    end

    #new form is at /bookings/new ~ test OK
    def new
      @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.user_id = current_user.id
        @booking.status = :waiting
        @booking.total_price_calculation

        # Redirect to vehicle show page if error occurs
          if @booking.total_price == 0
            redirect_to vehicle_path(@booking.vehicle), notice: 'Booking error. Invalid dates.'
          elsif @booking.save
            redirect_to booking_path(@booking), notice: 'Booking was successfully created!'
          else
            redirect_to vehicle_path(@booking.vehicle), notice: 'Booking error. Try again.'
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
    
    def average_rating_calculation(vehicle)
      reviews = vehicle.reviews
      return 0 if reviews.empty?

      total_rating = reviews.sum(:rating)
      average_rating = total_rating.to_f / reviews.size
      average_rating.round(1)
  end
end
