Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope 'auth' do
  post "signup", to: "users#signup"
  #post "/auth/logout", to: "users#logout"
  post "login", to: "users#login"
  post "logout", to: "users#logout"
  end

  resources :users
end
