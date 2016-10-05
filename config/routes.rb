Rails.application.routes.draw do
  root 'home#index'

  devise_for :brokers, controllers: { sessions: 'brokers/sessions'}
  devise_for :bidders, controllers: { sessions: 'bidders/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
