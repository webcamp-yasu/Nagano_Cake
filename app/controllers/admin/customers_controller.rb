class Admin::CustomersController < ApplicationController

  #管理者ユーザーだけアクセスできる
  # before_action :authenticate_admin!

  def index #会員一覧ページ
    @customers = Customer.page(params[:page]).per(10)
  end

  def show #会員詳細ページ
    @customer = Customer.find(params[:id])
  end

  def edit #会員編集ページ
    @customer = Customer.find(params[:id])
  end

  def update #会員情報更新アクション
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報変更しました"
      redirect_to admin_customer_path(@customer)
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end

end
