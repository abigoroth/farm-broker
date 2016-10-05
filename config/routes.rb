Rails.application.routes.draw do
<<<<<<< HEAD
  root 'home#index'

  devise_for :brokers, controllers: { sessions: 'brokers/sessions'}
  devise_for :bidders, controllers: { sessions: 'bidders/sessions'}
=======
<<<<<<< HEAD
  resources :districts
  resources :states
=======
  resources :bid_processes
  resources :bids
>>>>>>> 8736c6db1764aa93f01dd3feb7d8e9ae0b775426
>>>>>>> 823f4197d064b07d8c193c1959ff8e2cad2bddc1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
