class Admin::SearchController < ApplicationController

  def search
    @model = params[:search][:model]
    @content = params[:search][:content]
    @method = params[:search][:method]
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'customer'
      if method == 'perfect'
        Customer.where(email: content)
      elsif method == 'forward'
        Customer.where('email LIKE ?', content+'%')
      elsif method == 'backward'
        Customer.where('email LIKE ?', '%'+content)
      else
        Customer.where('email LIKE ?', '%'+content+'%')
      end
    elsif model == 'item'
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

end
