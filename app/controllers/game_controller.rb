class GameController < ApplicationController
  def show
    @game = Game.find_by_id(params[:id])
  end

  def index
    @games = Game.all
  end

end
