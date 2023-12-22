class SellersController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.products.order(created_at: :desc)
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])
    if @product.update(product_params)
      redirect_to seller_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    redirect_to seller_path, notice: 'Product was successfully destroyed.'
  end

  def show
    @seller = Seller.find_by_user_id(current_user.id)
    @products_amount_total = Product.where(seller_id: @seller.id).count
    @products_amount_sold = Product.where(seller_id: @seller.id).where(buyer_id: !nil).count
    @products_amount_not_sold = Product.where(seller_id: @seller.id).where(buyer_id: nil).count
    @net_gain = Product.where(seller_id: @seller.id).where(buyer_id: !nil).sum(:price)
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :description, images: [])
  end


end
