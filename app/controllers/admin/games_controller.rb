class Admin::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def edit
  end

  def index
  end

  def destroy
    @review = Game.find(params[:id])
    @review.destroy
    redirect_to admin_game_path
  end
end
