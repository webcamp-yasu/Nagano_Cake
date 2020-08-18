class Admin::ItemsController < ApplicationController
# 　　before_action :authenticate_user!

	# 商品一覧ページ
	def index
		@items = Item.all
	end

	# 商品新規登録ページ
	def new
		@item = Item.new
	end

	# 商品追加アクション
	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to # 商品一覧ページのpath
	end

	# 商品詳細ページ
	def show
		@item = Item.find(prams[:id])
	end

	# 商品編集ページ
	def edit
		@item = Item.find(prams[:id])
	end

	# 商品編集アクション
	def update
		@item = Item.find(prams[:id])
		if @item.update(item_params)
			flash[:success] = "商品情報を編集しました"
		    redirect_to #商品詳細ページのpath
		else
			render :edit
	end

    def　taxprice
    	@tax = Item.price * 1.1
    end
	private

	def item_params
		params.require(:Item).permit(:name,:image_id,:introduction,:price,:is_active)
  end
end
