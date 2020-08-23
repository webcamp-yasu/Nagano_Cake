class Customer::ItemsController < ApplicationController

   def index
   	@items = Item.page(params[:page]).per(8)
   	@genres = Genre.page(params[:page]).per(10)
   end

   def show
   	@item = Item.find(params[:id])
   	@genres = Genre.page(params[:page]).per(10)
    @cart_item = CartItem.new
   end
end