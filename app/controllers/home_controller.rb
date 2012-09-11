class HomeController < ApplicationController
  #root
  def index
    @products = Product.limit(25)

  	respond_to do |format|
  	  format.html
    end
  end
end
