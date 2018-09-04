Rails.application.routes.draw do

  root "welcome#top"
  get "about" => "welcome#about"

  resources :users, except: [:new]
  get  "signup" => "users#new"
  post  "signup" => "users#create"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  # temporary
  get "/sessions/recover" => "sessions#recover"

  resources :projects

  post "/projects/follow" => "projects#follow_project"
end
