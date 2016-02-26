Rails.application.routes.draw do root :to => 'dashboard#index'
  devise_for :guests
  devise_for :users
  devise_for :admins, controllers: { registrations: 'registrations' }
  get 'dashboard/index'
  resources :cash_collections
  resources :attendance_rates, :except => [:show, :edit, :update]
  resources :expences
  resources :attr2s
  resources :attr3s
  resources :users
  resources :guests
  resources :rooms
  resources :offices
  resources :companies
  resources :services
  resources :attendances, :only => [:index, :tasks] do
    get :tasks, on: :collection
  end
  resources :events
  resources :event_groups
  namespace :admin do
    root 'dashboard#index'
    resources :attr1s
    resources :service_names
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
