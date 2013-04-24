class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def about
  end

  def contact
  end

  def terms
  end

  def privacy
  end
end
