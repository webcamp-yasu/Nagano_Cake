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
        Customer.where(email: content).page(params[:page]).per(10)
      elsif method == 'forward'
        Customer.where('email LIKE ?', content+'%').page(params[:page]).per(10)
      elsif method == 'backward'
        Customer.where('email LIKE ?', '%'+content).page(params[:page]).per(10)
      else
        Customer.where('email LIKE ?', '%'+content+'%').page(params[:page]).per(10)
      end
    elsif model == 'item'
      if method == 'perfect'
        Item.where(name: content).page(params[:page]).per(10)
      elsif method == 'forward'
        Item.where('name LIKE ?', content+'%').page(params[:page]).per(10)
      elsif method == 'backward'
        Item.where('name LIKE ?', '%'+content).page(params[:page]).per(10)
      else
        Item.where('name LIKE ?', '%'+content+'%').page(params[:page]).per(10)
      end
    end
  end

end
