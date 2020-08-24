class Customer::CartItemsController < ApplicationController
	before_action :authenticate_customer!
	#カート内商品一覧ページ
	def index
		@cart_items = current_customer.cart_items
	end
	#カート内商品追加アクション
  def create
  		@cart_item = current_customer.cart_items.new(cart_item_params)
  		@check_item = CartItem.find_by(item_id: @cart_item.item.id, customer_id: current_customer.id)
        if @check_item.present?
  			@cart_item.amount += @check_item.amount
  			@check_item.destroy
  		end
			@cart_item.save
            flash[:notice] = "商品をカートに追加しました"
            redirect_to cart_items_path
  end

	#カート内商品削除アクション
	def destroy
		@cart_item = CartItem.find(params[:id])
		 if @cart_item.destroy
		 	flash[:notice] = "カートの商品を削除しました"
		 	redirect_to cart_items_path
		else
			render action: :index
		end
	end
	#カート内を全て空にするアクション
	def destroy_all
		@cart_items = CartItem.where(customer_id: current_customer.id)
		if CartItem.destroy_all
			flash[:notice] = "カートの商品を全て削除しました"
  			redirect_to cart_items_path
		else
			render action: :index
		end
	end
	#カート内商品更新アクション
	def update
		@cart_item = CartItem.find(params[:id])
		if @cart_item.update(cart_item_params)
			redirect_to cart_items_path
		else
			render action: :index
		end
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:amount, :item_id)
	end

end
