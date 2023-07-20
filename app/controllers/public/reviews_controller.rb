class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new

  end

  def show
    @review = Review.find(params[:id])
  end

  def index
    @reviews = Review.all
  end

  def edit
  end

  def create
    #byebug
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to game_path(@review), notice: "You have created book successfully."
    else
       render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comment, :game_id)
  end

  #「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
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
