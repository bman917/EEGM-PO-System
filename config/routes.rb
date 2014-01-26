EEGM::Application.routes.draw do
  #devise_for :users

  #This will disallow creating and deleting new users
  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end




  get "purchase_items/index"
  get "purchase_items/new"
  get "purchase_items/create"
  get "purchase_items/destroy"
  get "purchase_items/update"
  get "purchase_order_contacts/index"
  get "purchase_order_contacts/new"
  get "purchase_order_contacts/create"
  get "purchase_order_contacts/destroy"
  get "purchase_order_contacts/update"
  resources :item_deliveries

  resources :purchase_orders

  resources :supplier_items

  resources :items

  resources :suppliers

  resources :contacts

  resources :phones

  resources :purchase_order_contacts

  resources :purchase_items

  get 'supplier/names', to: 'suppliers#names'
  get 'contact/names', to: 'contacts#names'
  get 'item/names', to: 'items#names'
  get 'phone/numbers', to: 'phones#numbers'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'purchase_orders#index'

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
