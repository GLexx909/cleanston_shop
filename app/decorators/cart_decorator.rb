class CartDecorator
  def initialize(cart)
    @cart = cart
  end

  def total_price
    @cart.cart_items.sum { |item| CartItemDecorator.new(item).total_price }
  end

  def total_price_with_currency
    "#{total_price} #{currency_symbol}"
  end

  def currency_symbol
    "₽"
  end
end
