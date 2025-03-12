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

    target = dom_id(cart_item, :quantity_buttons)
    component = CartItemQuantityButtonsComponent.new(cart_item:)

    render turbo_stream: turbo_stream.replace(target, render_to_string(component))
  end
end
