class GameController < ApplicationController
  def show
    @game = Game.find_by_id(params[:id])
    @comment = Comment.new
    @comment.game_id=params[:id]
    @existing_comments = Comment.find_all_by_game_id(@game.id)
  end

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @genres = Genre.all#.map{|genre| [genre.name, genre.id]}
  end

  def create
    @game = Game.new(params[:game])
    @game.save
  end

end
