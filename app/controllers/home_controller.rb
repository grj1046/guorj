class HomeController < ApplicationController
  def index
    @articles = Article.all.limit(10)
  end
end
