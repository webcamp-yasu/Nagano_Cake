Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  root "customer/homes#top"
  namespace :customer do
  	get "homes/about" => "homes#about"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
