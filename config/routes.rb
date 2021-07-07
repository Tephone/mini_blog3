Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: %i[index show]
  resources :blogs
  resources :relationships, only: %i[create destroy]
  root 'blogs#index'
end
