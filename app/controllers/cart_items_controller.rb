class CartItemsController < ApplicationController
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
    result = CartItems::Destroy.new(cart_item_id: params[:id]).call

    if result
      target = "toggle_cart_button_#{result.product.id}"
      component = ToggleCartButton.new(product: result.product)

      render turbo_stream: turbo_stream.replace(target, render_to_string(component))
    else
      redirect_to root_path
    end
  end
end
