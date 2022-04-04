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
  get "set_on_time", to: 'appointments#set_on_time'
  get "set_off_time", to: 'appointments#set_off_time'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
