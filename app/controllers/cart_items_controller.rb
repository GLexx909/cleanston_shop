class CartItemsController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @cart = Current.user.cart
    result = CartItems::Create.new(cart: @cart, product_id: params[:product_id]).call

    if result
      target = "toggle_cart_button_#{params[:product_id]}"
      component = ToggleCartButton.new(product: result.cart_item.product)

      render turbo_stream: turbo_stream.replace(target, render_to_string(component))
    else
      redirect_to root_path
    end
  end

  def destroy
    cart = Current.user.cart
    result = CartItems::Destroy.new(cart_item_id: params[:id], cart:).call

    if result
      target = "toggle_cart_button_#{result.product.id}"
      component = ToggleCartButton.new(product: result.product)

      render turbo_stream: turbo_stream.replace(target, render_to_string(component))
    else
      redirect_to root_path
    end
  end

  def update_quantity
    cart = Current.user.cart
    cart_item = CartItem.find_by(id: params[:id], cart_id: cart.id)
    cart_item = CartItems::UpdateQuantity.new(cart_item, params[:action_type]).call

    target_quantity_buttons = dom_id(cart_item, :quantity_buttons)
    component_quantity_buttons = CartItemQuantityButtonsComponent.new(cart_item:)

    target_sum = dom_id(cart_item, :sum)
    component_sum = CartItemSumComponent.new(cart_item:)

    target_full_sum = dom_id(cart, :full_sum)
    component_full_sum = CartFullSumComponent.new(cart:)

    render turbo_stream: [
      turbo_stream.replace(target_quantity_buttons, render_to_string(component_quantity_buttons)),
      turbo_stream.replace(target_sum, render_to_string(component_sum)),
      turbo_stream.replace(target_full_sum, render_to_string(component_full_sum))
    ]
  end
end
