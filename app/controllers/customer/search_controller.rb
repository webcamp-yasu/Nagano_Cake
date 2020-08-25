class Customer::SearchController < ApplicationController

  def search
    @model = params[:search][:model]
    @content = params[:search][:content]
    @method = params[:search][:method]
    @records = search_for(@model, @content, @method)
    @genres = Genre.page(params[:page]).per(10)
  end

  private

  def search_for(model, content, method)
    if model == 'item'
      if method == 'perfect'
        Item.where(name: content).page(params[:page]).per(8)
      elsif method == 'forward'
        Item.where('name LIKE ?', content+'%').page(params[:page]).per(8)
      elsif method == 'backward'
        Item.where('name LIKE ?', '%'+content).page(params[:page]).per(8)
      else
        Item.where('name LIKE ?', '%'+content+'%').page(params[:page]).per(8)
      end
    else model == 'genre' && method == ''
      @genre = Genre.find_by(name: content)
      Item.where(genre_id: @genre.id).page(params[:page]).per(8)
    end
  end

end
