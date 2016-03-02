Rails.application.routes.draw do root :to => 'dashboard#index'
  devise_for :guests, controllers: { registrations: 'guest_registrations' }
  devise_for :users, controllers: { registrations: 'user_registrations' }
  devise_for :admins, controllers: { registrations: 'admin_registrations' }
  get 'dashboard/index'
  get 'about', to: 'dashboard#about'
  resources :users
  resources :guests

  namespace :admin do
    root 'dashboard#index'
    resources :companies
    resources :offices
    resources :rooms
    resources :services
    resources :service_names
    resources :cash_collections
    resources :expences
    resources :attr1s
    resources :attr2s
    resources :attr3s
    resources :event_groups
    resources :events, :except => [:show, :delete]
    resources :attendances, :only => [:index, :alltasks] do
      get :alltasks, on: :collection
    end
    resources :attendance_rates, :except => [:show, :edit, :update]
  end

  namespace :user do
    root 'dashboard#index'
    resources :event_groups
    resources :events, :except => [:index, :show, :delete]
    resources :attendances, :only => [:alltasks, :mytasks] do
      get :alltasks, :mytasks, on: :collection
    end
  end

  namespace :guest do
    root 'dashboard#index'
  end
end
