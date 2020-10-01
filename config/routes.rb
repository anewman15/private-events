Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/regisgtrations', sessions: 'users/sessions' }
  
  devise_scope :user do
    root 'users/registrations#new'
  end
end
