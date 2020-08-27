class Customer::ItemsController < ApplicationController

   def index
     @items = Item.page(params[:item_page]).per(8)
   	 @genres = Genre.page(params[:genre_page]).per(4)
   end

   def show
     @item = Item.find(params[:id])
   	 @genres = Genre.page(params[:genre_page]).per(4)
     @cart_item = CartItem.new
   end

end