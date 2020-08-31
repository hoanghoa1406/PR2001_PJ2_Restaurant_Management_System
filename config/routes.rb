Rails.application.routes.draw do
  namespace :admin do
    resources :order_details
    resources :order_tables
    resources :orders
    resources :menus
    resources :categories do
      resources :dishes
    end
    resources :reviews
    resources :tables
    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
