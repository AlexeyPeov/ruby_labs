class ProductPolicy < ApplicationPolicy
  def index?
    true
  end
  def show?
    seller = Seller.find_by(user_id: user.id)
    record.seller_id == seller.id or user.buyer?
  end
  def create?
    user.seller?
  end
  def update?
    seller = Seller.find_by(user_id: user.id)
    record.seller_id == seller.id
  end
  def destroy?
    update?
  end
end

