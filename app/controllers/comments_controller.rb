class CommentsController < ApplicationController
  private
  def comment_params
    params.require(:comment).permit(:content).merge(article_id: params[:article_id], user_id: current_user.id)
  end
end
