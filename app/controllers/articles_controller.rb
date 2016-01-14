class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :new], except: [:show, :index]
  before_action :set_article, except: [:index, :new, :create]
  before_action :authenticate_editor!, only: [:new, :create, :update]
  before_action :authenticate_admin!, only: [:destroy]

  #get
  def index
    @articles = Article.all
  end

  #get /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  #get /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  #post /articles
  def create
    @article = current_user.articles.new(article_params)
    #lanzar una excepcion para mostar los paramaetros que llegan
    #raise params.to_yaml
    @article.categories = params[:categories]
    if @article.save
      redirect_to @article
    else
      render :new
    end

  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def edit
  end
  #put /articles/:id
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

#  def validate_user
#    redirect_to new_user_session_path, notice: "Necesitas iniciar sesion"
#  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :cover, :categories)
  end

end
