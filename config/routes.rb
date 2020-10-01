Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, only: [:new, :create, :show]
  
  devise_scope :user do
    root 'users/registrations#new'
  end
end
