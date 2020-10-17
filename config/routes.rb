# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, only: %i[new create show]
  resources :events, except: %i[edit update destroy]
  resources :event_attendings, only: %i[new create]

  devise_scope :user do
    root 'events#index'
  end
end
