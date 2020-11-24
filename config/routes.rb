Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  root 'tweets#index'
  resources :tweets
  get "hashtags/:hashtag", to: "tweets#hashtags", as: "hashtag"

  post 'friend/:user_id', to: 'friends#create', as: 'create_friend'
  post 'retweet/:id', to: "retweets#create", as: "create_retweet"
  get 'likes/:id', to: 'likes#index', as: 'likes'
  delete 'destroy/:id', to: 'likes#destroy', as: 'destroy_like'
  post 'like/:id', to: "likes#create", as: "create_like"
  get 'retweets/:id', to: 'retweets#index', as: 'retweets'
  get 'retweet/:id', to: 'retweets#new', as: 'retweet'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
