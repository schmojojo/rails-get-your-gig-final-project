Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  get "ai-create", to: "gigs#ai_create"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Profile Routes
  get "/profile",       to: "users#show",   as: :profile
  get "/profile/edit",  to: "users#edit",   as: :edit_profile
  patch "/profile",     to: "users#update"


  resources :gigs
  # Defines the root path route ("/")
  # root "posts#index"
end
