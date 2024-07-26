class Vendor::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :accept, :refuse, :ongoing, :completed]

  def index
    @vendor_id = current_user.id
    @vehicles = Vehicle.all.where(user_id: @vendor_id)
    @bookings = Booking.all.where(vehicle_id: @vehicles.pluck(:id))
  end
  
  def accept
    @booking.accepted!
    if params[:from] == "show"
      redirect_to vendor_booking_path(@booking), notice: "Booking was successfully accepted!"
    else
      redirect_to vendor_bookings_path, notice: "Booking was successfully accepted!"
    end
  end

  def refuse
    @booking.refused!
    if params[:from] == "show"
      redirect_to vendor_booking_path(@booking), notice: "Booking was refused!"
    else
      redirect_to vendor_bookings_path, notice: "Booking was refused!"
    end
  end

  def ongoing
    @booking.ongoing!
    if params[:from] == "show"
      redirect_to vendor_booking_path(@booking), notice: "Booking was delivered!"
    else
      redirect_to vendor_bookings_path, notice: "Booking was delivered!"
    end
  end

  def completed
    @booking.completed!
    if params[:from] == "show"
      redirect_to vendor_booking_path(@booking), notice: "Booking was received!"
    else
      redirect_to vendor_bookings_path, notice: "Booking was received!"
    end
  end

  def show
  end
  
  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status, :vehicle_id)
  end
end
