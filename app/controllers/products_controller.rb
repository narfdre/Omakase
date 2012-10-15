class ProductsController < ApplicationController
  before_filter :require_login, :except => [:show, :new, :create]

  # GET /products/:slug
  # GET /products/:slug.json
  def show
    @product = Product.find_by_slug(params[:id])
  end

  # GET /upload
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /upload
  # POST /upload.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: 'Product was successfully submitted. Thank you!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to '/admin', notice: 'Product was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    
    if @product.destroy
      render json: @product, :status => :ok
    else
      render json: @product, :status => '500'
    end
  end

  def makeFeatured
    @product = Product.find(params[:id])
    @product.featured = true;
    if @product.save
      render json: @product, :status => :ok
    else
      render json: @product, :status => '500'
    end
  end

  def removeFeatured
    @product = Product.find(params[:id])
    @product.featured = false;
    if @product.save
      render json: @product, :status => :ok
    else
      render json: @product, :status => '500'
    end
  end

  def display
    @product = Product.find(params[:id])
    @product.display = true;
    if @product.save
      render json: @product, :status => :ok
    else
      render json: @product, :status => '500'
    end
  end
end
