class Admin::ItemsController < ApplicationController

	before_action :authenticate_admin!

	# 商品一覧ページ
	def index
		@items = Item.page(params[:page]).per(10)
	end

	# 商品新規登録ページ
	def new
		@item = Item.new
	end

	# 商品追加アクション
	def create
		@item = Item.new(item_params)
		if @item.save
			flash[:notice] = "新商品を登録しました"
			redirect_to admin_item_path(@item)
		else
			render "new"
		end
	end

	# 商品詳細ページ
	def show
		@item = Item.find(params[:id])
	end

	# 商品編集ページ
	def edit
		@item = Item.find(params[:id])
	end

	# 商品編集アクション
	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			flash[:success] = "商品情報を編集しました"
			redirect_to admin_item_path(@item)
		else
			render "edit"
		end
	end

	private

	def item_params
		params.require(:item).permit(:name,:image,:detail,:price,:is_active,:genre_id)
	end

end
