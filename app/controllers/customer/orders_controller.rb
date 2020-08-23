class Customer::OrdersController < ApplicationController

    def new
    	@order = Order.new
    	@addresses = Address.where(customer:current_customer)
    end

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

    def confirm
    	@order = Order.find(params[:id])
    end

	def thanks
	end

	def create
		@order = current_customer.orders.new(order_params)
		@order.save
		redirect_to thanks_path
	end

    private

    def order_params
	params.require(:order).permit(:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
	end
end
