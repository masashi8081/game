class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!, except: [:top]

  def new
    @review = Review.new

  end

  def show
    @review = Review.find(params[:id])
    @game = Game.find(@review.game.id)
    @customer = current_customer
    @review_comment = ReviewComment.new

  end

  def index
    @search = Review.ransack(params[:q])
    @reviews = @search.result(distinct: true).order(created_at: :desc)

  end



  def edit
  end

  def create

    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to game_path(@review.game_id), notice: "You have created review successfully."
    else
      redirect_to game_path(@review.game_id)
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
