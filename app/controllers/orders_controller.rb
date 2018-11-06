class OrdersController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @product = Product.find(params[:product_id])
      @order = Order.new
      @order.product_id = @product.id
      @amount = @product.price + @product.shipping_price
    end
  
    def show
      @order = Order.find(params[:id])
      @total_price = @order.product_price + @order.shipping_price
    end
  
    def create
      @product = Product.find(params[:product_id])
  
      @amount = @product.price + @product.shipping_price
  
  
      @order = Order.new(order_params)
      @order.product = @product
      @order.product_title = @product.name
      @order.product_price = @product.price
      @order.shipping_price = @product.shipping_price
      @order.user = current_user
  
      if @order.valid?
        customer = Stripe::Customer.create(
          email: params[:stripeEmail],
          source: params[:stripeToken]
        )
  
        charge = Stripe::Charge.create({
          customer: customer.id,
          amount:  @amount,
          description: 'Rails Stripe customer',
          currency: 'aud',
          receipt_email: current_user.email
        })
      end
  
      if @order.save
        @order.product.stock -= 1
        @product.save
        redirect_to @order #change this to order confirmation path
      else
        render :new
        @order.errors
      end
    end
  
    private
  
    def order_params
      params.require(:order).permit(:user, :product, :purchase_price)
    end
  end