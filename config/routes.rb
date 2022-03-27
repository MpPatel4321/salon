Rails.application.routes.draw do
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/admin/sidekiq'

  devise_for :users
  root to: 'dashboard#index'
  resources "dashboard"
  get "/users/dashboard/owner_sign_up", to: 'dashboard#owner_sign_up'
  resources "shops"
  resources "services"
  resources "appointments"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
