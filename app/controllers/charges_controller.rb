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
            # creates the order entry for the order table
            if charge.paid
            Order.create!(
                    :seller_id => @product.user_id,
                    :product_title => @product.product_title,
                    :price => @product.price,
                    :product_id => @product.id,
                    :quantity => 1,
                    :buyer_id => current_user.id,
                    )

            @product.decrement(:quantity)
            @product.save

            end
                    
                    flash[:notice] = "Thanks for your payment of A$#{@product.price}"
                    redirect_to products_path
                    
                rescue Stripe::CardError => email
                    flash[:error] = e.message
                    redirect_to new_charge_path, :product => product
                    
                    
                    
                end
                
                
                
            end