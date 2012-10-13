class AdminController < ApplicationController
  before_filter :require_login, :except => [:loggingIn, :login, :setup, :createSetup]

  protect_from_forgery

  def index
  	@products = Product.find(:all, :order => "featured DESC, created_at DESC")
  end

  def loggingIn
  	@user = User.new
  end

  def login
  	user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
  		session[:user_id] = user.id
  		redirect_to "/admin", :notice => "Logged in!"
  	else
  		flash[:notice] = "Invalid email or password"
  		redirect_to "/login"
    end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out!"
  end
end
