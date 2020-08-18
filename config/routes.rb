Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  root "customer/homes#top"

  get "customers/mypage" => "customer/customers#show"
  get "/about" => "customer/homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
