class CartItemSumComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(cart_item:)
    @cart_item = cart_item
  end

  private

  def sum_element
    CartItemDecorator.new(@cart_item).total_price_with_currency
  end

  def sum_classes
    base_classes = "w-full md:w-20 flex-1 text-right text-lg font-semibold text-gray-700 md:text-left"
    class_names(base_classes)
  end
end
