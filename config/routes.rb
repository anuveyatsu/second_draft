Rails.application.routes.draw do

  get 'subscribers/create'

  resources :orders
  get 'account/index', as: 'account'
  get 'account/new', as: 'account_new'
  get 'account/seller', as: 'account_seller'
  get 'account/pickupstore', as: 'account_pickupstore'
  get 'account/history', as: 'account_history'
  get 'account/add', as: 'account_create'
  get 'account/edit', as: 'account_edit'
  post 'account/receive'
  post 'account/release'
  get 'account/download_pdf'

  devise_for :sellers
  devise_for :pickups

  root 'welcome#index'

  resources :subscribers

  get 'register', to: 'account#new', as: :register
  get 'login', to: 'account#index', as: :login

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
