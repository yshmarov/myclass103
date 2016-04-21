Rails.application.routes.draw do root :to => 'dashboard#index'
  devise_for :guests, controllers: { registrations: 'guest_registrations' }
  devise_for :users, controllers: { registrations: 'user_registrations' }
  devise_for :admins, controllers: { registrations: 'admin_registrations' }
  get 'dashboard/index'
  get 'about', to: 'dashboard#about'
  namespace :admin do
    root 'dashboard#index'
    get 'dashboard/stats'
    get 'dashboard/docs'
    resources :companies
    resources :offices
    resources :rooms
    resources :services, :except => [:show]
    resources :service_names, :except => [:show]
    resources :cash_collections, :except => [:show, :edit]
    resources :expences, :except => [:edit]
    resources :attr1s, :except => [:show]
    resources :attr2s, :except => [:show]
    resources :attr3s, :except => [:show]
    resources :sales
    resources :event_groups do
      get :active, :forming, :finished, :errors, on: :collection
    end
    resources :events, :except => [:show, :delete]
    resources :attendances, :only => [:index, :alltasks] do
      get :alltasks, on: :collection
    end
    resources :attendance_rates, :except => [:show, :edit, :update]
    resources :guests
    resources :users
    resources :comments
  end

  namespace :user do
    root 'dashboard#index'
    resources :event_groups do
      get :active, :forming, :finished, :errors, on: :collection
    end
    resources :events, :except => [:index, :show, :delete]
    resources :attendances, :only => [:alltasks, :mytasks] do
      get :alltasks, :mytasks, on: :collection
    end
    resources :guests
    resources :users
    resources :comments
  end

  namespace :guest do
    root 'dashboard#index'
    resources :guests, :only => [:show, :edit, :update]
  end
end
