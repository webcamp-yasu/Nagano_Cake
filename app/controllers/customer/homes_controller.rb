class Customer::HomesController < ApplicationController

  def about
	end

	def top
    @genres = Genre.all
    @random = Item.order("RANDOM()").limit(4)
	end
end
