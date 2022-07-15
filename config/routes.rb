Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

scope '/auth' do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    post "/logout", to: "users#logout"
end

resources :watchlists
resources :reviews
resources :shows
resources :users
end
