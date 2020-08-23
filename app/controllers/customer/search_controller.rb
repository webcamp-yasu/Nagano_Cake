class Customer::SearchController < ApplicationController

  def search
    @model = params[:search][:model]
    @content = params[:search][:content]
    @method = params[:search][:method]
    @records = search_for(@model, @content, @method)
    @genres = Genre.all
  end

  private

  def search_for(model, content, method)
    if model == 'item'
      if method == 'perfect'
        Item.where(name: content)
      elsif method == 'forward'
        Item.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        Item.where('name LIKE ?', '%'+content)
      else
        Item.where('name LIKE ?', '%'+content+'%')
      end
    else model == 'genre' && method == ''
      @genre = Genre.find_by(name: content)
      Item.where(genre_id: @genre.id)
    end
  end

end
