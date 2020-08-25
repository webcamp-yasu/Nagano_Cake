class Customer::HomesController < ApplicationController

	def about
	end

	def top
		@genres = Genre.page(params[:page]).per(10)
		@random = Item.order("RANDOM()").limit(4)
	end
end
