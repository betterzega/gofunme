Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "home#index"

  resources :events

  resources :users, only: [] do
    resources :events, only: [:index], controller: 'user_events'
  end
end
