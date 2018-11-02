class ChargesController < ApplicationController
    def new
    end

   def create
       @product = Product.find(session[:product_id])
       @amount = (@product.price * 100).to_i

       customer = Stripe::Customer.create(
           :email => params[:stripeEmail],
           :source => params[:stripeToken]
       )
# creates charge for stripe
       charge = Stripe::Charge.create(
           :customer => customer.id,
           :amount => @amount,
           :description => @product.product_title,
           :currency => 'aud'
       )

   flash[:notice] = "Thanks for your payment of A$#{@product.price}"
   redirect_to products_path

       rescue Stripe::CardError => email
           flash[:error] = e.message
           redirect_to new_charge_path, :product => product
   end

end
