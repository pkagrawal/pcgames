class GameController < ApplicationController

  def show
    @game = Game.find_by_id(params[:id])
    @genre = Genre.find_by_id(@game.genre_id)
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

  def rate
    @game = Game.find(params[:id])
    @user_rating = Integer(params[:rating])
    ex_votes = @game.votes
    new_votes = 0
    new_rating = 0
    if(ex_votes == 0)
      new_votes = 1
      new_rating = @user_rating
    else
      new_rating = (ex_votes*@game.rating + @user_rating)/(ex_votes + 1);
      new_votes = ex_votes + 1;
    end
    @game.update_attribute(:votes, new_votes);
    @game.update_attribute(:rating, new_rating);
    redirect_to @game
  end

  def votes
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @game }
      format.js
    end
  end

  def games
    @games = Game.all
    respond_to do |format|
      format.html { render 'index' }
      format.xml
    end
  end

end
