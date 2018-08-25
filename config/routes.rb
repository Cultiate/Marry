Rails.application.routes.draw do

  get "/" => "welcome#top"
  get "about" => "welcome#about"

  resources :users

  get "projects/new" => "projects#new"
  get "projects/edit" => "projects#edit"
  get "projects/index" => "projects#index"
  get "projects/show" => "projects#show"

end
