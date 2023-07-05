class Public::GamesController < ApplicationController
  def show
  end

  def index
    @games = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
  end

  def search
    if params[:keyword]
      @games = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :hardware, :label, :sales_date, :mediumImage_url, :largeImage_url)
  end
end
