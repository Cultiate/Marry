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
  get "/projects/:id/confirm" => "projects#project_confirm", as: "project_confirm"
  get "/projects/:id/celebrate/:return_id" => "projects#celebrate", as: "project_celebrate"
  get "/projects/:id/thanks/:return_id" => "projects#thanks", as: "project_thanks"
  get "/projects/:id/confirm/:return_id" => "projects#return_confirm", as: "return_confirm"

end
