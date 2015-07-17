class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @articles = Article.new
  end

  def create
	@articles = Article.new(article_params)
	@articles.save
	redirect_to @articles
  end

  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy
    redirect_to articles_path
  end

  def edit
	@articles = Article.find(params[:id])
  end

  def update
	@articles = Article.find(params[:id])
	if @articles.update(article_params)
	  redirect_to @articles
	else
	  render 'edit'
	end
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
