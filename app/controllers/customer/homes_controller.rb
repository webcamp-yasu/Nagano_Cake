class Customer::HomesController < ApplicationController

	def about
	end

	def top
    @genres = Genre.page(params[:genre_page]).per(4)
    @random = Item.order("RANDOM()").limit(4)
	end
end
