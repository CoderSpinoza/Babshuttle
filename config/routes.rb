Babshuttle::Application.routes.draw do


  devise_for :users, :controllers => {registrations: "registrations", sessions: "sessions", omniauth_callbacks: "omniauth" }
  resources :items
  resources :orders do
    collection do
      get 'address', as: "address"
      post 'final', as: "final"
      post 'email'
    end
  end

  get '/congrat' => "home#congrat", as: "congrat"
  get '/about' => "home#about", as: "about"
  get '/team' => "home#team", as: "team"
  get '/contact' => "home#contact", as: "contact"
  get '/metrics' => "home#metrics", as: "metrics"
  get '/stats' => "home#stats", as: "stats"
  get '/fan/wait' => "home#fan_wait", as: "fan_wait"
  get '/fan' => "home#fan", as: "fan"
  root 'home#index'
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
