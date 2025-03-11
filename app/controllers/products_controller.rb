class ProductsController < ApplicationController
  def index
    @products = Product.available
  end
end
