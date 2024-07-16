class Vendor::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def index
    @vendor = current_user.id
    @bookings = Booking.all.where(id: @vendor)
  end

  def show
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
