class AdminController < ApplicationController
  protect_from_forgery

  def index
  	@products = Product.all

  	respond_to do |format|
  	  format.html
    end
  end

  def signUp
	@user = User.new(params[:user])
	if @user.save
		render :json => '{message: "Logged In"}'
	else
		render "new"
	end
  end

  def logIn
	user = User.authenticate(params[:email], params[:password])
	if user
		session[:user_id] = user.id
		redirect_to root_url, :notice => "Logged in!"
	else
		flash.now.alert = "Invalid email or password"
		render "new"
	end
  end

  def logOut
	session[:user_id] = nil
	redirect_to root_url, :notice => "Logged out!"
  end
end
