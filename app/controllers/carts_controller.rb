class CartsController < ApplicationController
  def show
    @cart = Current.user.cart
    @cart_items = @cart.cart_items
  end

  def destroy_cart_items
    CartItem.where(cart: Current.user.cart).destroy_all
    redirect_to root_path
  end
end
