class BuyersController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).limit(50)
  end

  def buy_product
    product = Product.find(params[:product_id])
    buyer = Buyer.find_by(user_id: current_user.id)

    if buyer.balance >= product.price && product.amount > 0
      product.amount -= 1
      buyer.balance -= product.price
      product.seller.balance += product.price

      ActiveRecord::Base.transaction do
        product.save!
        buyer.save!
        product.seller.save!
      end

      redirect_to product, notice: 'Product was successfully purchased.'
    else
      redirect_to product, alert: 'You do not have enough funds or the product is out of stock.'
    end
  end
end
