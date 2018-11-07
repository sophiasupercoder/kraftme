class OrdersController < ApplicationController
    #index view only for admin
    def index
        if current_user.has_role?(:admin)
        @orders = Order.all
        else
            redirect_to products_path
        end
    end
    
    def new
        @order = Order.new
    end
    
    def create
        @order = Order.new(order_params)
    end
    #For order history view
    def myorders
        @myorders = Order.where(:buyer_id => current_user.id)
    end
    #For sales history view
    def mysales
        @mysales = Order.where(:seller_id => current_user.id)
    end
    
    
    def order_params
        params.require(:order).permit(:product_title, :price, :seller_id, :buyer_id, :product_id)
    end
end
