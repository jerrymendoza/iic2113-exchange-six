Rails.application.routes.draw do
  root to: 'documentation#index'

  use_doorkeeper do
    controllers tokens: 'custom_tokens'
    # No need to register client application
    #skip_controllers :applications, :authorized_applications
  end

  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
      devise_for :users, controllers: {
           registrations: 'api/v1/users/registrations',
       }, skip: [:sessions, :password]

      resources :transactions
      get 'accounts/tokens', to: 'accounts#tokens'
      get 'users/get_transactions', to: 'users#get_transactions'
      post 'accounts/generate_token', to: 'accounts#generate_token'
      resources :accounts
      resources :coins
      resources :users
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
