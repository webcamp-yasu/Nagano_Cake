class Customer::SearchController < ApplicationController

  def search
    @content = params[:search][:content]
    @method = params[:search][:method]
    @records = search_for(@content, @method)
  end

  private

  def search_for(content, method)
    if method == 'perfect'
      Item.where(name: content)
    elsif method == 'forward'
      Item.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Item.where('name LIKE ?', '%'+content)
    else
      Item.where('name LIKE ?', '%'+content+'%')
    end
  end

end
