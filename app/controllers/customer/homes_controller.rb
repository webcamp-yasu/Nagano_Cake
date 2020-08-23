class Customer::HomesController < ApplicationController

	def about
	end

	def top
		@random = Item.order("RANDOM()").limit(4)
	end
end
