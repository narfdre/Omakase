class HomeController < ApplicationController
  #root
  def index
    @products = Product.find(:all, :conditions => ["display = ?", true], :limit => 25, :order => "featured, created_at DESC")
    @settings = Setting.first

  	respond_to do |format|
  	  format.html
    end
  end
end
