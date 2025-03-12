class CartItemQuantityButtonsComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(cart_item:)
    @cart_item = cart_item
  end

  private

  def button_element(action_type:)
    return if @cart_item.quantity < 2 && action_type == "decrease"

    button_label = action_type == "increase" ? "+" : "-"

    button_to button_label, update_quantity_cart_item_path(@cart_item, action_type:),
              method: :patch, class: button_classes, data: { turbo_frame: dom_id(@cart_item) }
  end

  def button_classes
    base_classes = "bg-gray-200 text-gray-700 px-3 py-2 hover:bg-gray-300 transition"
    class_names(base_classes)
  end
end
