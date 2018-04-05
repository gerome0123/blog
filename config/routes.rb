Rails.application.routes.draw do
  devise_for :authors, skip: %i[sessions registrations]
  as :author do
    get 'UserLogin' => 'devise/sessions#new', as: :new_author_session
    post 'UserLogin' => 'devise/sessions#create', as: :author_session
    get 'ChangePassword' => 'auth/registrations#edit', as: :edit_author_registration
    put 'EditPassword' => 'auth/registrations#update', as: :author_registration
    match 'Logout' => 'devise/sessions#destroy', as: :destroy_author_session,
          via: Devise.mappings[:author].sign_out_via
  end

  get 'locales/:part/:locale' => 'translations#show', as: :locales
  get 'templates/:name' => 'templates#show'
  get 'templates/:prefix/:name' => 'templates#show', as: :template

  root to: 'home#index'

  resources :authors

  namespace :v1, module: 'api/v1', as: :api, except: %i[new edit] do

  end
end
