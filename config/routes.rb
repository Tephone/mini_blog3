Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: %i[index show]
  resources :blogs
  root 'blogs#index'
end

