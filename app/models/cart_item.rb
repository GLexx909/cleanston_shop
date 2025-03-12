class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product_id, uniqueness: { scope: :cart_id }
end
