class StaticPagesController < ApplicationController
  def home
    @contact = Contact.new
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
