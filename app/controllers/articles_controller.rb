class ArticlesController < ApplicationController
  def index
    @articles = Article.all 
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    render json: {title: @article.title, body: @article.body}
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json:errors.full_messages, status: :unprocessable_entity
    end
  end

  def delete
    @article = Article.find(params[:id])
    if @article.destroy
      render json:@article
    else
      render json:erros.full_messages, status: :unprocessable_entity
    end

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render json:@article
    else
      render json: @article.errors.full_messages, status: :unprocessable_entity
    end
  end
end
private
  def article_params
    params.require(:article).permit(:title, :body)
  end
