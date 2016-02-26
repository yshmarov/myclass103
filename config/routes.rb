Rails.application.routes.draw do root :to => 'dashboard#index'
  devise_for :guests
  devise_for :users
  devise_for :admins, controllers: { registrations: 'registrations' }
  get 'dashboard/index'
  resources :users
  resources :guests
  resources :events
  resources :event_groups
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
    resources :attendances, :only => [:index, :tasks] do
      get :tasks, on: :collection
    end
    resources :attendance_rates, :except => [:show, :edit, :update]
  end
  namespace :user do
    root 'dashboard#index'
    resources :attendances, :only => [:tasks] do
      get :tasks, on: :collection
    end
  end
  namespace :guest do
    root 'dashboard#index'
  end
end
