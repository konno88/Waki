Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'articles#top'

   resources :articles
   resource :profile, only: [:show, :edit, :update]
   resources :accounts, only: [:show, :index]
   resources :rooms, only: [:show, :create]
   resources :messages, only: [:create]
end
