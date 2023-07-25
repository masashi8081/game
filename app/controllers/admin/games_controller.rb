class Admin::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @customer = current_customer
  end

  def edit
  end

  def index
  end
end
