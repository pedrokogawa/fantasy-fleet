class Vendor::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :accept, :refuse]

  def index
    @vendor_id = current_user.id
    @vehicles = Vehicle.all.where(user_id: @vendor_id)
    @bookings = Booking.all.where(vehicle_id: @vehicles.pluck(:id))
  end
  
  def accept
    @booking.accepted!
    redirect_to vendor_bookings_path, notice: "Booking was successfully accepted!"
    @disabled_dates = Booking.where(vehicle_id: @booking.vehicle_id).map do |booking|
      { from: booking.start_date.to_s, to: booking.end_date.to_s }
    end
  end

  def refuse
    @booking.refused!
    redirect_to vendor_bookings_path, notice: "Booking was refused!"
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
