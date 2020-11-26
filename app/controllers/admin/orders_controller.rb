class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@orders =  Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@customer = @order.customer
  	@order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    #注文ステータスを1つ「入金待ち」に更新すると、製作ステータスが「製作待ち」に更新
    if params[:order][:status] == "confirmpayment"
      @order.order_details.update(production_status: "waiting")
      flash[:notice] = "注文ステータスと製作ステータスを更新しました"
    else
      flash[:notice] = "注文ステータスを更新しました"
    end
    
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :billing_amount, :payment_method, :postal_code, :address, :address_name, :status, :created_at)
  end

end