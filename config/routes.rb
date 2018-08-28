Rails.application.routes.draw do

  get 'projects/create'

  get 'projects/destroy'

  root "welcome#top"
  get "about" => "welcome#about"

  resources :users, except: [:new]
  get  "signup" => "users#new"
  post  "signup" => "users#create"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :projects

end
