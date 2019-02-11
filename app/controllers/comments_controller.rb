class CommentsController < ApplicationController
  def create

    if @comment = Comment.create(comment_params)
      redirect_to article_path(@comment.article)
    else
      redirect_to articles_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(article_id: params[:article_id], user_id: current_user.id)
  end
end
