Rails.application.routes.draw do
  resources :farmers
  resources :bidders
  resources :brokers
  devise_for :farmers
  resources :friendships
  resources :chat_rooms do
  resources :messages
  end

  resources :broker_friends

  resources :wallposts
  resources :comments

  get 'bids/farmer_bids', to: 'bids#farmer_bids', as: 'farmer_bids'

  get 'user_views/meta'
  get 'user_views/profile'
  post 'user_views/profile', to: 'user_views#create'
  get 'user_views/:id/remove_photo', to: 'user_views#remove_photo', as: 'remove_user_photo'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions',
  confirmations: 'users/confirmations', passwords: 'users/passwords'}

  resources :places
  resources :cities
  resources :states
  get 'broker_views/index'

  get 'bidder_views/index'
  get 'cities/:state', to: 'application#cities'
  resources :produces
  resources :farmsites do 
    resources :reviews
  end

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
    mount ActionCable.server => '/cable'
mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'farmsites/farmprofile/:id', to: 'farmsites#farmprofile', as: 'farmprofile'
end
