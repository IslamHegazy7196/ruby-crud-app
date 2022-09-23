class ArticlesController < ApplicationController
 
  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspectnew
    @article = Article.new(article_params)
    if @article.save
      flash[:notice]="article was successfully created"
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end

