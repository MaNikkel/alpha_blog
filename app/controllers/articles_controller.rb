class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    id = params[:id]
    @article = Article.find(id)
  end

  def new

  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))

    @article.save

    redirect_to @article
  end
end
