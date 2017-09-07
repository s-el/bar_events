class ReviewsController < ApplicationController

  def new
    # we need @bar in our `simple_form_for`
    @bar = Bar.find(params[:bar_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    bar = Bar.find(params[:bar_id])
    @review.bar = bar

    if @review.save
      redirect_to bar_path(bar)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
