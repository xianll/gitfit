class UserController < ApplicationController
  
  def account
    @orders = Order.where(user_id: current_user.id)
  #   @orders_array = []
  #   @orders_array_new = @orders_array << @orders
  #   # @product = Product.where(id: orders.product_id)
  #   # @product_ids = Product.where
    @products = Product.all
  end

  def myproducts
    @products = Product.where(user_id: current_user)
  end

end

