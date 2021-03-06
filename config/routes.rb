Rails.application.routes.draw do

  root "welcome#top"
  get "about" => "welcome#about"
  get "search" => "welcome#index"

  resources :users
  get  "signup" => "users#new"
  get '/auth/:provider/callback' =>'users#create', as: :auth_callback
  post  "signup" => "users#create"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :projects

  post "/projects/follow" => "projects#follow_project"
  get "/projects/:id/confirm" => "projects#project_confirm", as: "project_confirm"
  get "/projects/:id/celebrate/:return_id" => "projects#celebrate", as: "project_celebrate"
  get "/projects/:id/confirm/:return_id" => "projects#return_confirm", as: "return_confirm"
  get "/projects/:id/thanks/:return_id" => "projects#thanks", as: "project_thanks"
  get "/invitations/new" => "invitations#new"
  get "/invitations/make" => "invitations#make"

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :messages, :only => [:show, :create]
  resources :rooms, :only => [:create, :show, :index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
