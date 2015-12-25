class ArticlesController < ApplicationController
  #get
  def index
    @articles = Article.all
  end

  #get /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  #get /articles/new
  def new
    @article = Article.new
  end

  #post /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  #put /articles/:id
  def update
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
