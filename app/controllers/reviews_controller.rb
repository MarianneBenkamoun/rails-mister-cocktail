class ReviewsController < ApplicationController


  def new
    # we need @restaurant in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
