class CartFullSumComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(cart:)
    @cart = cart
  end

  private

  def sum_element
    CartDecorator.new(@cart).total_price_with_currency
  end
end
