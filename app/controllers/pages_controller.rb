class PagesController < ApplicationController
  
  def home
    redirect_to articles_path if logged_in?
  end
  
  def about
  end
  
  def deletewebsite
    flash[:danger] = "Really?"
    redirect_to root_path
  end
  
  def mememode
    flash[:info] = "Meme mode activated. Be careful."
    redirect_to root_path
  end
  
end