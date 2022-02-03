class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    id = params[:id]
    @article = Article.find(id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))

    if @article.save
      flash[:notice] = 'Article saved'
      redirect_to @article
    else
      render :new
    end

  end
end
