class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      redirect_to article_path(@comment.article)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(article_id: params[:article_id], user_id: current_user.id)
  end
end
