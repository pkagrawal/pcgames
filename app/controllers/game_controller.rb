class GameController < ApplicationController
  def show
  end

  def index
    @games = Game.all
  end

end
