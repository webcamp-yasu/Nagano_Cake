class Admin::OrderDetailsController < ApplicationController
	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.update(order_detail_params)
		flash[:success] = "製作ステータスを更新しました"
		redirect_to admin_orders_path(order)
	end
	private
	def order_detail_params
	params.require(:order_detail).permit(:production_status)
end
