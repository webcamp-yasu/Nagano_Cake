class Admin::OrdersController < ApplicationController
  #before_action :authenticate_admin!
	def index
		@orders =  Order.all
	end
	def show
		@order = Order.find(params[:id])
		@order_detail_all = Order_detail.all.sum(:price)
		@customer = @order.customer
		order_detail = @order.order_detail
		
	end
	def update
	end
end
