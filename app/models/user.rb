class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :email, length: { maximum: 100 }, format: { with: /\A[a-zA-Z0-9. _-]+@[a-zA-Z0-9. -]+\.[a-zA-Z]{2,4}\z/ }
  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 100 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { seller: 0, buyer: 1 }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role = is_buyer ? :buyer : :seller
  end
end