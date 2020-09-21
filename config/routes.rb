Rails.application.routes.draw do
  root 'pages#home'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
   as :user do

    get "profile" => "devise/sessions#show"
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get '/users/sign_out' => 'devise/sessions#destroy'
    resources :users, :only =>[:show] do
      resources :orders
    end
  

   end

  resources :tables
 
end

