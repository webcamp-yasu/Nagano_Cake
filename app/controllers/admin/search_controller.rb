class Admin::SearchController < ApplicationController

  def search
    @content = params[:search][:content]
    @records = search_for(@content)
  end

  private

  def search_for(content)
    Item.where('name LIKE ?', '%'+content+'%').page(params[:page]).per(10)
  end

end
