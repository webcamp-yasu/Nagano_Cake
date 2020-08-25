class Customer::AddressesController < ApplicationController
	before_action :authenticate_customer!

	#配送先一覧ページ・登録ページ
	def index
		@address = Address.new
		@addresses = current_customer.address
	end

	#配送先新規登録アクション
	def create
		@address = Address.new(address_params)
		@address.customer_id = current_customer.id
		@addresses = current_customer.address
		if @address.save(address_params)
			flash[:notice] = "配送先を登録しました"
			redirect_to addresses_path
		else
			@addresses = current_customer.address
			render "index"
		end
	end

	def show
	end

	#配送先編集ページ
	def edit
		@address = Address.find(params[:id])
	end

	#配送先編集アクション
	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
			flash[:notice] = "更新に成功しました"
			redirect_to addresses_path
		else
			render "edit"
		end
	end

	#配送先削除アクション
	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		flash[:notice] = "配送先を削除しました"
		redirect_to addresses_path
	end

	private

	def address_params
		params.require(:address).permit(:name, :postal_code, :address)
	end

end
