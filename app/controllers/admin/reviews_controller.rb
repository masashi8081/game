class Admin::ReviewsController < ApplicationController
  def show
  end

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def edit
  end

  def destroy
    @review = Review.find(params[:id])
    review.destroy
    redirect_to admin_game_path
  end

end
