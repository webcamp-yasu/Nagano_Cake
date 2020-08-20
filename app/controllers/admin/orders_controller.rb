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
		if @order.update(order_params)
			flash[:success] = "注文ステータスを更新しました"
			redirect_to admin_orders_path(order)
		else
			render :edit
	end
	end

	  private
	  def order_params
	    params.require(:order).permit(:customer_id, :postage, :billing_amount, :payment_method, :postal_code, :address, :address_name, :status, :created_at)
	  end
end
