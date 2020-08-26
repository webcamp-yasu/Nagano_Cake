class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #会員新規登録時のパス
  def after_sign_up_path_for(resource)
    mypage_customers_path
  end

  #ログイン時のパス
  def after_sign_in_path_for(resource)
    if customer_signed_in?
      mypage_customers_path
    else
      admin_root_path
    end
  end

  #ログアウト時のパス
  def after_sign_out_path_for(resource)
    case resource
    when :customer
      root_path
    when :admin
      new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number])
  end

end
