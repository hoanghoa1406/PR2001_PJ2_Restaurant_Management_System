Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
   as :user do

    get "profile" => "devise/sessions#show"
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get '/users/sign_out' => 'devise/sessions#destroy'
    resources :users, :only =>[:show]     
  end
  root 'pages#home'
  get 'home', to: 'pages#home'
  # namespace :admin do
  #   resources :order_details
  #   resources :order_tables
  #   resources :orders
  #   resources :menus
  #   resources :categories do
  #     resources :dishes
  #   end
  #   resources :reviews
  #   resources :tables
  #   resources :users
  #   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # end
end

