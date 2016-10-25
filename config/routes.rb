Rails.application.routes.draw do


  resources :broker_friends

  get 'user_views/profile'
  get 'user_views/:id/remove_photo', to: 'user_views#remove_photo', as: 'remove_user_photo'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions',
  confirmations: 'users/confirmations'}

  resources :places
  resources :cities
  resources :states
  get 'broker_views/index'

  get 'bidder_views/index'
  get 'cities/:state', to: 'application#cities'
  resources :produces
  resources :farmsites

  root 'home#index'
  get 'home/about'
  get 'home/news'
  get 'home/contact'
  get 'home/district_page'
  devise_for :brokers, controllers: { registrations: 'brokers/registrations',sessions: 'brokers/sessions'}
  devise_for :bidders, controllers: { registrations: 'bidders/registrations',sessions: 'bidders/sessions'}


  resources :bid_processes
  resources :bids do
    get 'purchase', on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
