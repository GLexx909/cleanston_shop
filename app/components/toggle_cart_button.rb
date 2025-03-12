class ToggleCartButton < ViewComponent::Base
  def initialize(product:)
    @product = product
    cart = Current.user.cart
    @cart_item ||= cart.cart_items.find_by(product: @product)
  end

  private

  def cart_button_id
    "cart_button_#{@product.id}"
  end

  def classes
    base_classes = "mt-2 text-white px-4 py-2 rounded cursor-pointer"
    specific_color = @cart_item.present? ? "bg-blue-500 hover:bg-blue-600" : "bg-green-500 hover:bg-green-600"
    class_names(base_classes, specific_color)
  end
end
