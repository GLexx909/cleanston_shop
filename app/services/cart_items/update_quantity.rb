module CartItems
  class UpdateQuantity
    def initialize(cart_item, action_type)
      @cart_item = cart_item
      @action_type = action_type
    end

    def call
      return unless %w[increase decrease].include?(@action_type)

      if @action_type == "increase"
        @cart_item.increment!(:quantity)
      elsif @action_type == "decrease"
        return if @cart_item.quantity == 1

        @cart_item.decrement!(:quantity)
      end

      @cart_item
    end
  end
end
