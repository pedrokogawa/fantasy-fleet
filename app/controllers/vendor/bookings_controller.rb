class Vendor::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :accept, :refuse]

  def index
    @vendor_id = current_user.id
    @vehicles = Vehicle.all.where(user_id: @vendor_id)
    @bookings = policy_scope(Booking.all.where(vehicle_id: @vehicles.pluck(:id)))
  end
  
  def accept
    authorize @booking
    @booking.accepted!
    redirect_to vendor_bookings_path, notice: "Booking was successfully accepted!"
  end

  def refuse
    authorize @booking
    @booking.refused!
    redirect_to vendor_bookings_path, notice: "Booking was refused!"
  end

  def show
    authorize @booking
  end
  
  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status, :vehicle_id)
  end
end
