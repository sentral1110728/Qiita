class ArticlesController < ApplicationController

  def index
  end

  def new
  end

  def create
    Article.create(article_params)
  end

  private
  def article_params
    params.permit(:title, :text, :image)
  end

end
