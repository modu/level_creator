LevelCreator::Application.routes.draw do
  match 'showGames',  :to => 'gameConfigurations#showGames',    :via => :get
  match 'createGame', :to => 'gameConfigurations#createGame',   :via => :get
  match 'created',    :to => 'gameConfigurations#created',      :via => :post
  match 'createLevel/:gameName', :to => 'gameConfigurations#createLevel',  :via => :get
  match 'createdLevel/:gameName', :to => 'Levels#created', :via => :post
  match 'showLevel/:gameName/:levelName/xml', :to => 'Levels#xml', :via => :get
  
  #match 'mathfact/sequences/index',         :to => 'sequences#index' ,       :via => :get
  match ':gameName/sequences/create',        :to => 'sequences#create',       :via => :get  # show the form for creating sequences
  match ':gameName/sequences/created',       :to => 'sequences#created',      :via => :post  # receives and creates new sequences
  #match 'mathfact/sequences/show',          :to => 'sequences#show',         :via => :get   # show existing sequences
  #match 'mathfact/sequences/load/(:id)',            :to => 'sequences#load',         :via => :get   # show existing sequences
  #match 'mathfact/sequences/load/updated',          :to => 'sequences#updated',      :via => :post   # receive and update sequences
  match ':gameName/sequences/xml/:sequenceName',             :to => 'sequences#xml',          :via => :get   # show existing sequences


  #match 'mathfact/sequences/index',         :to => 'sequences#index' ,       :via => :get
  match ':gameName/experiments/create',        :to => 'experiments#create',       :via => :get  # show the form for creating experiments
  match ':gameName/experiments/created',       :to => 'experiments#created',      :via => :post  # receives and creates new experiments
  #match 'mathfact/experiments/show',          :to => 'sequences#show',         :via => :get   # show existing sequences
  #match 'mathfact/experiments/load/(:id)',            :to => 'sequences#load',         :via => :get   # show existing sequences
  #match 'mathfact/sequences/load/updated',          :to => 'sequences#updated',      :via => :post   # receive and update sequences
  match ':gameName/experiments/xml/:experimentName',             :to => 'experiments#xml',          :via => :get   # show existing experiments
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
