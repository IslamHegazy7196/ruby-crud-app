class ArticlesController < ApplicationController

  def index
    @articles=Article.all  
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspectnew
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'article was successfully created'
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    flash[:danger] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = 'article was successfully edited'
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
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

