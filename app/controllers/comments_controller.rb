class CommentsController < ApplicationController
  def new
    @comment = Comment.new(params[:comment])
    @comment.game_id = params[:game_id]
    @comment.save
  end

end
