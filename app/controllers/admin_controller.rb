class AdminController < ApplicationController
  protect_from_forgery

  def index
  	@products = Product.all

  	respond_to do |format|
  	  format.html
    end
  end
end
