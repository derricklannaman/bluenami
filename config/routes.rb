Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations'}
  root "dashboard#show"
  resources :voter_guides, only: [:index, :new, :create, :show]
end
