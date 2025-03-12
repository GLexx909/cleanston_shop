class CartItemComponent < ViewComponent::Base
  def initialize(cart_item:)
    @cart_item = cart_item
    @product = @cart_item.product
  end
end
