class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @artcile = Article.new(article_params)
    @artcile.save
    flash[:success] = "Article has been created"
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
