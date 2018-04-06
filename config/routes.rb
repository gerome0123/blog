Rails.application.routes.draw do
  devise_for :users, class_name: 'Author', skip: %i[sessions registrations]
  as :user do
    get 'UserLogin' => 'devise/sessions#new', as: :new_user_session
    post 'UserLogin' => 'devise/sessions#create', as: :user_session
    get 'ChangePassword' => 'auth/registrations#edit', as: :edit_user_registration
    put 'EditPassword' => 'auth/registrations#update', as: :user_registration
    match 'Logout' => 'devise/sessions#destroy', as: :destroy_user_session,
          via: Devise.mappings[:user].sign_out_via
  end

  get 'locales/:part/:locale' => 'translations#show', as: :locales
  get 'templates/:name' => 'templates#show'
  get 'templates/:prefix/:name' => 'templates#show', as: :template

  root to: 'home#index'

  resources :authors

  namespace :v1, module: 'api/v1', as: :api, except: %i[new edit] do
    resources :authors
  end
end
