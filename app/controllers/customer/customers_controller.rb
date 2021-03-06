class Customer::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show #マイページ
    @customer = current_customer
  end

  def quit #退会ページ
  end

  def withdraw #退会アクション
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session #ログアウトさせる
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit #登録情報編集ページ
    @customer = current_customer
  end

  def update #更新アクション
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to mypage_customers_path
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end
