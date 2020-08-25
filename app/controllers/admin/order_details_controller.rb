class Admin::OrderDetailsController < ApplicationController

	def update
		@order_detail.update(order_detail_params)
		redirect_to admin_orders_path(order)
	end

	private

	def order_detail_params
		params.require(:order_detail).permit(:item_id, :order_id, :amount, :number, :price, :production_status)
	end

end
