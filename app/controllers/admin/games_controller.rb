class Admin::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @customer = current_customer
  end

  def edit
  end

  def index
  end

  def destroy
    review = Review.find(params[:id])
    game = review.game
    review.destroy
    redirect_to admin_game_path(game.id)
  end
end
