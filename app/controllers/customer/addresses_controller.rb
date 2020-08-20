class Customer::AddressesController < ApplicationController
	before_action :authenticate_customer!

	#配送先一覧ページ・登録ページ
	def index
		@address = Address.new
		@addresses = Address.all
	end

	#配送先新規登録アクション
	def create
		@address = Address.new(address_params)
		@address.save
		redirect_to addresses_path
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
			redirect_to addresses_path
		else
			render "edit"
		end
	end

	#配送先削除アクション
	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to addresses_path
	end

	private

	def address_params
		params.require(:address).permit(:name, :postal_code, :address)
	end

end
