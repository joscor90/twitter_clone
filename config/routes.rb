Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'tweets#index'
  resources :tweets

  delete 'destroy/:id', to: 'likes#destroy', as: 'destroy_like'
  get 'like/:id', to: "likes#create", as: "create_like"
  get 'retweets/:id', to: 'retweets#index', as: 'retweets'
  get 'retweet/:id', to: 'tweets#retweet', as: 'retweet'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
