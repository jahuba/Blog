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
    @article = Article.new(title: params[:article][:title], body: params[:article][:body])
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

end
