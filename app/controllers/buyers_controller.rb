class BuyersController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).limit(50)
  end

  def buy_product
    product = Product.find(params[:product_id])
    buyer = Buyer.find_by(user_id: current_user.id)

    if buyer.balance >= product.price
      buyer.balance -= product.price
      product.seller.balance += product.price
      product.buyer_id = buyer.id

      ActiveRecord::Base.transaction do
        product.save!
        buyer.save!
        product.seller.save!
      end

      redirect_to '/', notice: 'Product was successfully purchased.'
    else
      redirect_to '/', notice: 'You do not have enough funds or the product is out of stock.'
    end
  end

  def show
    buyer = Buyer.find_by(user_id: current_user.id)
    @products = Product.where(buyer_id: buyer.id)
    @products_amount_total = Product.where(buyer_id: buyer.id).count
    @net_gain = Product.where(buyer_id: buyer.id).sum(:price)

  end
end
