class Customer::HomesController < ApplicationController

  def about
	end

	def top
    @genres = Genre.all
	end

end
