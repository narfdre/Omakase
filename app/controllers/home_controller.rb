class HomeController < ApplicationController
  #root
  def index
    
  	respond_to do |format|
  	  format.html
    end
  end
end
