Rails.application.routes.draw do

  get 'projects/create'

  get 'projects/destroy'

  root "welcome#top"
  get "about" => "welcome#about"

  resources :users
  get  "/signup" => "users#new"
  post  "/signup" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "projects/new" => "projects#new"
  get "projects/edit" => "projects#edit"
  get "projects/index" => "projects#index"
  get "projects/show" => "projects#show"

end
