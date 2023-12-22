class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def show
    @product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    seller = Seller.find_by(user_id: current_user.id)
    @product.seller_id = seller.id
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :amount, :price, :description, images: [])
  end
end
