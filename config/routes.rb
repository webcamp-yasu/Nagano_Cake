Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :customers, controllers: {
    registrations: "customers/registrations",
    sessions: "customers/sessions"
  }

  #Customer

  root "customer/homes#top"
  get "about" => "customer/homes#about"

  scope module: :customer do

    #デフォルトだとdeviseの編集ページに跳んでしまうので指定
    get "customer/edit" => "customers#edit"
    put "customer" => "customers#update"

    resources :customers, only: [:show] do
      collection do
        get "mypage" => "customers#show"
        get "quit"
        patch "withdraw"
      end
    end
    resources :items
    resources :cart_items
    resources :orders
    resources :addresses
  end

  #Admin

  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
    resources :genres
    resources :orders do
      resource :order_details
    end
  end

end
