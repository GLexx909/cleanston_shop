module CartItems
  class Create
    attr_reader :cart, :product_id, :cart_item, :errors

    def initialize(cart:, product_id:)
      @cart = cart
      @product_id = product_id
      @errors = []
    end

    def call
      @cart_item = CartItem.create(product_id: product_id, cart_id: cart.id)
      if @cart_item.persisted?
        self
      else
        @errors = @cart_item.errors.full_messages
        nil
      end
    end
  end
end
