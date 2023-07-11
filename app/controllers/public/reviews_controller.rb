class Public::ReviewsController < ApplicationController
  def new
     @review = Review.new
     
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

  def read(result)
    title = result["title"]
    isbn = result["isbn"]
    label = result["label"]
    hardware = result["hardware"]
    salesDate = result["salesDate"]
    mediumImageUrl = result["mediumImageUrl"]
    largeImageUrl = result["largeImageUrl"]

    {
      title: title,
      isbn: isbn,
      label: label,
      hardware: hardware,
      salesDate: salesDate,
      mediumImageUrl: mediumImageUrl,
      largeImageUrl: largeImageUrl
    }
  end
end
