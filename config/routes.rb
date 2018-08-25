Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root "welcome#top"
  get "about" => "welcome#about"

  resources :users
  get  '/signup' => 'users#new'
  post  '/signup' => 'users#create'

  get "projects/new" => "projects#new"
  get "projects/edit" => "projects#edit"
  get "projects/index" => "projects#index"
  get "projects/show" => "projects#show"

end
