class OrdersController < ApplicationController
    
    def index
        @orders = Order.all
    end
    
    def new
        @order = Order.new
    end
    
    def create
        @order = Order.new(order_params)
    end
    
    def myorders
        @myorders = Order.where(:buyer_id => current_user.id)
    end
    
    def mysales
        @mysales = Order.where(:seller_id => current_user.id)
    end
    
    
    def order_params
        params.require(:order).permit(:product_title, :price, :seller_id, :buyer_id, :product_id)
    end
end
