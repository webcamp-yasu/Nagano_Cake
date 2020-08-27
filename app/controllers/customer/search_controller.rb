class Customer::SearchController < ApplicationController

  def search
    @model = params[:search][:model]
    @content = params[:search][:content]
    @records = search_for(@model, @content)
    @genres = Genre.page(params[:genre_page]).per(4)
  end

  private

  def search_for(model, content)
    if model == 'item'
      Item.where('name LIKE ?', '%'+content+'%').page(params[:item_page]).per(8)
    else model == 'genre'
      @genre = Genre.find_by(name: content)
      Item.where(genre_id: @genre.id).page(params[:item_page]).per(8)
    end
  end

end
