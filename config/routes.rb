Rails.application.routes.draw do
  root "home#top"
  get 'homes/about'
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
