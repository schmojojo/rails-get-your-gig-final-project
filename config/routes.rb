Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  get "/fetch-jobs", to: "gigs#fetch_jobs"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Profile Routes
  get "/profile",       to: "users#show",   as: :profile
  get "/profile/edit",  to: "users#edit",   as: :edit_profile
  patch "/profile",     to: "users#update"
  delete "/profile",                 to: "users#destroy"          # <- NEU


  # Password Routes
  get "/profile/password/edit",  to: "users#edit_password",   as: :edit_password
  patch "/profile/password",     to: "users#update_password", as: :update_password

  #bookmark Routes
  get "/profile",       to: "bookmarks#new"
  post "/profile",      to: "bookmarks#create"
  delete "/profile",    to: "bookmarks#destroy"

  resources :gigs
  resources :users, only: :index

  authenticate :user, ->(u) { u.admin? } do
    mount MissionControl::Jobs::Engine, at: "/jobs"
  end
end
