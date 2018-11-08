class ChargesController < ApplicationController
    def new
    end
    
    def create
        # lookup the product
        @product = Product.find(params[:product_id])
        # ProductMailer.with(user: current_user, product: @product).new_purchase.deliver_now
        customer = Stripe::Customer.create(
            :email => params[:stripeEmail],
            :source  => params[:stripeToken]
        )
 
        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => @product.price,
            :description => @product.title,
            :currency    => 'aud',
        )
        
            Order.create(
                product_id: @product.id,
                user_id: current_user.id,
                purchase_price: @product.price)
        
    rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
        

        # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to @product, notice: 'Program was successfully purchased.' }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    end

    # private
    # # # Use callbacks to share common setup or constraints between actions.
    # # def set_order
    # #   @product = Product.find(params[:id])
    # # end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def order_params
    #   result = params.require(:order).permit(:purchase_price, :user_id, :product_id)
    #   result[:purchase_price] = result[:purchase_price].to_f * 100.0
    #   result
    # end
end
