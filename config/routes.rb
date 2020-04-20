Rails.application.routes.draw do
  get 'sessions/new'
  get "/" => "blogs#top"
  get "blogs/list" => "blogs#list"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get "users/:id/like" => "users#like"
  resources :blogs 
  post "favorites/:blog_id/create" => "favorites#create"
  post "favorites/:blog_id/destroy" => "favorites#destroy"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
    #resources :blogs do
    #collection do
    #post :confirm
    #end
    #end
end
