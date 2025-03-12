class CartItemSumComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(cart_item:)
    @cart_item = cart_item
  end

  private

  def sum_element
    sum = @cart_item.product.price * @cart_item.quantity
    "#{sum} #{currency_symbol}"
  end

  def sum_classes
    base_classes = "w-full md:w-20 flex-1 text-right text-lg font-semibold text-gray-700 md:text-left"
    class_names(base_classes)
  end

  def currency_symbol
    "₽"
  end
end
