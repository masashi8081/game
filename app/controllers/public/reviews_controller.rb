class Public::ReviewsController < ApplicationController
  def new
     @review = Review.new
     @game = Game.
  end

  def show
  end

  def index
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to review_path(@review), notice: "You have created book successfully."
    else
      @reviews = Review.all
      render 'index'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comment)
  end



end
