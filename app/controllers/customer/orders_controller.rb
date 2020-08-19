class Customer::OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@order = order.find(params[:id])
	end

	def update
	end
end
