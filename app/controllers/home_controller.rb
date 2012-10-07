class HomeController < ApplicationController
  #root
  def index
    @products = Product.limit(25)
    @settings = Setting.first

  	respond_to do |format|
  	  format.html
    end
  end
end
