class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def new
    @review = Review.new
    @current_user_id = current_user.id
  end

  def create
    @review = Review.new(review_params)
    @review.rating = @review.rating.to_i
    if @review.save
      redirect_to @booking, notice: 'Review was successfully created.'
    else
      render :new
      raise
    end
  end

  def destroy
    @review = @booking.reviews.find(params[:id])
    @review.destroy
    redirect_to @booking, notice: 'Review was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:title, :comment, :rating, :user_id, :vehicle_id)
  end
end
