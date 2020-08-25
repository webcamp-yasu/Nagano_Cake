class Customer::OrdersController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_customer!

  def index
    #ログインしている会員のみの注文履歴
		@orders = current_customer.orders
	end

	def show
		@order = Order.find(params[:id])
    @order_details = @order.order_details
	end

  def new
    @order = Order.new
    #ログインしている会員のみの配送先住所
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(
      customer_id: current_customer.id,
      payment_method: params[:order][:payment_method]
    )

    #請求額合計データの受け渡し
    @order.billing_amount = billing(@order)

    #住所関連データ受け渡し
    #ご自身の住所
    if params[:order][:shipping_address] == "customer_address"
      @order.postal_code  = current_customer.postal_code
      @order.address      = current_customer.address
      @order.address_name = full_name(current_customer)
    #登録住所から選択
    elsif params[:order][:shipping_address] == "registered_address"
      shipping = Address.find_by(params[:order][:address])
      @order.postal_code  = shipping.postal_code
      @order.address      = shipping.address
      @order.address_name = shipping.name
    #新しい住所
    else params[:order][:shipping_address] == "new_address"
      @order.postal_code  = params[:order][:postal_code]
      @order.address      = params[:order][:address]
      @order.address_name = params[:order][:address_name]
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to thanks_orders_path

    #カート内商品を注文詳細に受け渡して、カートを空にする
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      OrderDetail.create(
        item_id: cart_item.item.id,
        order_id: @order.id,
        amount: cart_item.amount,
        price: sub_total(cart_item)
      )
    end
    @cart_items.destroy_all
  end

	def thanks
	end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :address_name, :billing_amount)
  end

end
