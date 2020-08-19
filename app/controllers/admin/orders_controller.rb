class Admin::OrdersController < ApplicationController
  #before_action :authenticate_admin!
	def index
		@orders =  Order.all
	end
	def show
		@order = Order.find(params[:id])
		@customer = @order.customer
		@order_details = @order.order_details


	end
	def update
		@order.update(order_params)
		redirect_to admin_orders_path(order)
	end
	  private
	  def order_params
	    params.require(:order).permit(:customer_id, :postage, :billing_amount, :payment_method, :postal_code, :address, :address_name, :status, :created_at)
	  end
end
