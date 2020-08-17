class Customer::CustomersController < ApplicationController

  before_action :authenticate_customer!
  #ログインしていないとアクセスできなくする

  def show #マイページ
    @customer = current_customer
  end

  def cancel #退会ページ
  end

  def withdraw #退会アクション
    @customer = current_customer
    @customer.update(is_deleted: true)
  end

  def edit #登録情報編集ページ
    @customer = current_customer
  end

  def update #更新アクション
    @customer = current_customer
    @customer.update(customer_params)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end
