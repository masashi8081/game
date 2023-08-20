class Public::HomesController < ApplicationController


  def top
    @reviews = Review.all.order(created_at: :desc)
  end

  def about
  end

  def search
    if params[:keyword]
      @games = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end
end
