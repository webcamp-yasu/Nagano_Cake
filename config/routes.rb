Rails.application.routes.draw do

  devise_for :admins,
    path: '',
    path_names: {
      sign_in: "admin/sign_in",
      sign_out: "admin/sign_out"
    },
    controllers: {
      sessions: "admins/sessions"
    }

  devise_for :customers, controllers: {
    registrations: "customers/registrations",
    sessions: "customers/sessions",
    passwords: "customers/passwords"
  }

  #Customer

  root "customer/homes#top"
  get "about" => "customer/homes#about"

  scope module: :customer do

    #デフォルトだとdeviseの編集ページに跳んでしまうので指定
    get "customer/edit" => "customers#edit"
    put "customer" => "customers#update"
    get "/search" => "search#search"

    resources :customers, only: [:show] do
      collection do
        get "mypage" => "customers#show"
        get "quit"
        patch "withdraw"
      end
    end
    resources :items, omly: [:index,:show]
      resources :cart_items, only: [:index, :create, :destroy, :update] do
      collection do
      delete "/" => "cart_items#destroy_all"
      end
    end
    resources :orders
    resources :addresses
  end

  #Admin

  namespace :admin do
    root 'homes#top'
    get "/search" => "search#search"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
    resources :genres
    resources :orders do
      resource :order_details
    end
  end

end
