class Admin::OrderDetailsController < ApplicationController

	before_action :authenticate_admin!

	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.update(order_detail_params)

        #製作ステータスを1つ「製作中」にすると、注文ステータスが「製作中」に更新
        if params[:order_detail][:production_status] == "working"
        	@order_detail.order.update(status: "makingitem")
        	flash[:notice] = "製作ステータスと注文ステータスを更新しました"
        end
		#製作ステータスが全て「製作完了」→注文ステータス発送待ち
		@all_order_details = @order_detail.order.order_details
		@not_done_order_details = @all_order_details.where.not(production_status: "done")
    	#製作ステータスが製作完了ではないofrder_details
    	if  @not_done_order_details.any?
    		flash[:notice] = "製作ステータスを更新しました"
    		redirect_to admin_order_path(@order_detail.order)
    	else
    		@order_detail.order.update(status: "prepareshipment")
    		flash[:notice] = "製作ステータスと注文ステータスを更新しました"
    		redirect_to admin_order_path(@order_detail.order)
    	end
    end

    private

    def order_detail_params
    	params.require(:order_detail).permit(:production_status)
    end

end
