class AdminController < ApplicationController
  before_filter :require_login, :except => [:loggingIn, :login, :setup, :createSetup]
  before_filter :require_setup, :only => [:setup, :createSetup]
  protect_from_forgery

  def index
  	@products = Product.all
  end

  def loggingIn
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		render "index"
  	else
  		render "home#index"
  	end
  end

  def login
  	user = User.authenticate(params[:user][:email], params[:user][:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to "/admin", :notice => "Logged in!"
  	else
  		flash[:notice] = "Invalid email or password"
  		render "/login"
  	end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out!"
  end

  def setup
    @user = User.new
    @settings = Setting.new
  end

  def createSetup
    @user = User.new(params[:user])
    @settings = Setting.new(params[:settings])
    if @user.save && @settings.save
      redirect_to "/admin"
    else
      flash[:notice] = "Something went wrong, try again"
      render "setup"
    end
  end

  private
    def require_setup
      if User.all.size > 0
        redirect_to "/admin"
      end
    end

end
