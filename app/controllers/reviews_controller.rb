class ReviewsController < ApplicationController
  before_action :set_vehicle, only: [:new, :create, :destroy]
  before_action :set_review, only: [:destroy]

  def new
    @review = Review.new
    @current_user_id = current_user.id
  end

  def create
    @review = Review.new(review_params)
    @review.rating = @review.rating.to_i
    if @review.save
      redirect_to @vehicle, notice: 'Review was successfully created.'
    else
      render :new
      raise
    end
  end

  def destroy
    @review.destroy
    redirect_to @vehicle, notice: 'Review was successfully deleted.'
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def set_review
    @review = @vehicle.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :comment, :rating, :user_id, :vehicle_id)
  end
end
