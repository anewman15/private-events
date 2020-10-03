Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, only: [:new, :create, :show]
  resources :events
  resources :event_attendings, only: [:new, :create]
  
  devise_scope :user do
    root 'events#index'
  end
end
