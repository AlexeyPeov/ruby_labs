class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.is_buyer
      @products = Product.where(buyer_id: nil).order(created_at: :desc).limit(50)
      buyer = Buyer.find_by(user_id: current_user.id)
      @balance = buyer.balance
    else
      seller = Seller.find_by(user_id: current_user.id)
      @products = seller.products.where(buyer_id: nil).order(created_at: :desc)
      @balance = seller.balance
    end
  end

  def edit
    @user = current_user
  end


  private

  def set_user
    @user = current_user
  end


end