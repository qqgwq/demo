class ProductsController < ApplicationController
  before_action :required_login
  def new
    @product = Product.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @products = Product.search(params[:search]).page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.json { render json: @products }
      format.js
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html {redirect_to @product}
        format.js
      else
        format.html {render :edit}
        format.js
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html {redirect_to @product}
      format.js 
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to cart_path
  end

  private
  def product_params
    params.require(:product).permit!
  end
end
