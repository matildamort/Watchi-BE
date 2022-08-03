Rails.application.routes.draw do

  resources :watchshows
  resources :watchlists
  root to: 'shows#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

scope '/auth' do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    post "/logout", to: "users#logout"
end

scope '/list' do
  get '/mylist', to: 'watchlists#getListID'
end


resources :users
resources :shows
resources :reviews
resources :watchlists
end
