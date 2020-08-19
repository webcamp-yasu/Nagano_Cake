class Admin::OrdersController < ApplicationController
<<<<<<< HEAD

	def index
	end

	def show
	end

	def new
	end

	def confirm
	end

	def create
	end

	def thanks
=======
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
>>>>>>> 1efff90ddf9aa67279062e74df4bc6a2ee905c18
	end
end
