class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show # this method handles requests to view a specific article, identified by its id parameter
    @article = Article.find(params[:id])
  end


end
