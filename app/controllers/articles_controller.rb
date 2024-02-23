class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def index
    @articles = Article.all
  end
  def show # this method handles requests to view a specific article, identified by its id parameter
    @article = Article.find(params[:id])
  end
  def new # new action instantiates a new article, but does not save it
    @article = Article.new
  end
  def create # create action instantiates a new article with values for the title and body, and attempts to save it
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy # The destroy action fetches the article from the database then redirects the browser to the root path with status code 303 See Other

  @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

end
