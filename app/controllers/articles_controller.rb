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

  def edit
    id = params[:id]
    @article = Article.find(id)
  end

  def update
    article_params = params.require(:article).permit(:title, :description)
    id = params[:id]

    @article = Article.find(id)
    if @article.update(article_params)
      flash[:notice] = 'Article updated'
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    id = params[:id]
    @article = Article.find(id)

    @article.destroy

    redirect_to articles_path
  end
end
