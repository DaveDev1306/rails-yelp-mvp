class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)

    # find the restaurant from the params
    @restaurant = Restaurant.find(params[:restaurant_id])
    # set the review's restaurant
    @review.restaurant = @restaurant

    if @review.save
      # handle a successful save
      redirect_to restaurant_path(@restaurant)
    else
      # handle when it doesn't save
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
