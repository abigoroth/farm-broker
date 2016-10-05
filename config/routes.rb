Rails.application.routes.draw do

  resources :produces
  resources :farmsites

  root 'home#index'

  devise_for :brokers, controllers: { registrations: 'brokers/registrations',sessions: 'brokers/sessions'}
  devise_for :bidders, controllers: { registrations: 'bidders/registrations',sessions: 'bidders/sessions'}

  resources :districts
  resources :states

  resources :bid_processes
  resources :bids

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
