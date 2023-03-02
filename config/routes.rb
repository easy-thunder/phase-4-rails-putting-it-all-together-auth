Rails.application.routes.draw do
  resources :recipes, only:[:index, :create]
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signup', to: "users#signup"
  get '/me', to: "users#show"
  delete "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"
end
