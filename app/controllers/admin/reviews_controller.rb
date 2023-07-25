class Admin::ReviewsController < ApplicationController
  def show
  end

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def edit
  end
end
