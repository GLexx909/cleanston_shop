module CartItems
  class Destroy
    attr_reader :cart_item, :product, :cart

    def initialize(cart_item_id:, cart:)
      @cart_item = CartItem.find_by(id: cart_item_id, cart: cart)
      @product = @cart_item&.product
    end

    def call
      return false unless @cart_item

      if @cart_item.destroy
        self
      else
        @errors = @cart_item.errors.full_messages
        nil
      end
    end
  end
end
