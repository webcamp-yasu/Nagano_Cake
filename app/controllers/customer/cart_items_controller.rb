class Customer::CartItemsController < ApplicationController
	#カート内商品一覧ページ
	def index
		@cart_items = CartItem.all
	end
	#カート内商品追加アクション
  def create
  	@cart_item = current_customer.cart_items.new(cart_item_params)
  	@cart_item.save
  	flash[:notice] = "商品をカートに追加しました"
    redirect_to items_path
  end
	#def create
	#    if @cart_item.blank?
	#      @cart_item = current_customer.cart_items.new(item_id: params[:item_id])
	#    end
	#    @cart_item.amount += params[:amount].to_i
	#    @cart_item.save
	#    redirect_to cart_items_path
	#end
	#カート内商品削除アクション
	def destroy
		 @cart_item.destroy
		 redirect_to cart_items_path

	end
	#カート内を全て空にするアクション
	def destroy_all
		CartItem.destroy_all
  		redirect_to cart_items_path
	end
	#カート内商品更新アクション
	def update
		@cart_item.update(amount: params[:amount].to_i)
		redirect_to cart_items_path
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:amount, :item_id)
	end

end
