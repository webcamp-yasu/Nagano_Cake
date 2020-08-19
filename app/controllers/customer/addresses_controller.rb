class Customer::AddressesController < ApplicationController

	#配送先一覧ページ・登録ページ
	def index
		@address = Address.new
		@addresses = Address.all
	end

	#配送先新規登録アクション
	def create
		@address = Address.new(address_params)
		#@address.customer_id = current_customer.id
		#if
		@address.save
			redirect_to addresses_path
		#else
			#@address.customer_id = current_customer.id
		#	@addresses = Address.all
		#	render 'index'
		#end
	end

	def show
	end

	#配送先編集ページ
	def edit
		@address = Address.find(params[:id])
		#@customer = @address.customer
		#if @customer != current_customer
			#redirect_to edit_address_path
		#end
	end

	#配送先編集アクション
	def update
		@address = Address.find(params[:id])
		#if
		@address.update(address_params)
			redirect_to addresses_path
		#else
			#render "edit"
		#end
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
