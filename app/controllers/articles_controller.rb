class ArticlesController < ApplicationController

  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
      redirect_to action: :index
    else
      redirect_to action: :show
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
      redirect_to action: :index
    else
      redirect_to action: :show
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def search
    @articles = Article.where('title LIKE(?)', "%#{params[:keyword]}%").limit(10)
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
