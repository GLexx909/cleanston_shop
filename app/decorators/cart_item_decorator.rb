class CartItemDecorator
  def initialize(cart_item)
    @cart_item = cart_item
  end

  def total_price
    @cart_item.product.price * @cart_item.quantity
  end

  def total_price_with_currency
    "#{total_price} #{currency_symbol}"
  end

  def currency_symbol
    "₽"
  end
end
