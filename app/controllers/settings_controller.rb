class SettingsController < ApplicationController
  before_filter :require_login, :except => [:new, :create]
  before_filter :require_setup, :except => [:edit, :update]

  def new
    @user = User.new
    @settings = Setting.new
  end

  def edit
    @user = User.first
    @settings = Setting.first
  end

  def create
    @user = User.new(params[:user])
    @settings = Setting.new(params[:settings])

    if @user.save && @settings.save
      flash[:notice] = "Congrats! You are all set up."
      redirect_to "/admin"
    else
      flash[:notice] = "Something went wrong, try again"
      render "new"
    end
  end

  def update
    @user = User.find(params[:user][:id])
    @settings = Setting.find(params[:settings][:id])

    if params[:user][:password].blank?
      params[:user].delete(:password)
      @user.update_password = false
    else
      @user.update_password = true
    end

    if @user.update_attributes(params[:user]) && @settings.update_attributes(params[:settings])
      flash[:notice] = "Setting updated."
      redirect_to "/admin"
    else
      flash[:notice] = "Something went wrong, try again"
      render "edit"
    end
  end

  private
    def require_setup
      if User.all.size > 0
        redirect_to "/admin"
      end
    end
end

