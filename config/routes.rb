LevelCreator::Application.routes.draw do
  match 'showGames',  :to => 'gameConfigurations#showGames',    :via => :get
  match '/showLevel/:gameName', :to => 'levels#show',            :via => :get
  match '/activeGames', :to => 'gameConfigurations#activeGames', :via => :get
  match '/all',         :to => 'gameConfigurations#all', :via => :get
  match '/addToActiveGames',    :to => 'gameConfigurations#addToActiveGames', :via => :post
  match 'createGame', :to => 'gameConfigurations#createGame',   :via => :get
  match 'created',    :to => 'gameConfigurations#created',      :via => :post
  match 'createLevel/:gameName', :to => 'gameConfigurations#createLevel',  :via => :get
  match 'createdLevel/:gameName', :to => 'Levels#created', :via => :post
  match 'showLevel/:gameName/:levelName/xml', :to => 'Levels#xml', :via => :get
  
  match 'delete/:gameName',      :to => 'gameConfigurations#delete',       :via => :get
  match 'showLevel/delete',     :to => 'levels#delete',             :via => :post
  
  #match 'mathfact/sequences/index',         :to => 'sequences#index' ,       :via => :get
  match ':gameName/sequences/create',        :to => 'sequences#create',       :via => :get  # show the form for creating sequences
  match ':gameName/sequences/created',       :to => 'sequences#created',      :via => :post  # receives and creates new sequences
  match ':gameName/sequences/show',          :to => 'sequences#show',         :via => :get   # show existing sequences
  match ':gameName/sequences/update',          :to => 'sequences#update',      :via => :post   # receive and update sequences
  match ':gameName/sequences/xml/:sequenceName',             :to => 'sequences#xml',          :via => :get   # show existing sequences
  match ':gameName/sequences/delete',                     :to => 'sequences#delete',      :via => :post
  match ':gameName/sequences/updated',                      :to => 'sequences#updated',     :via => :post

  #match 'mathfact/sequences/index',         :to => 'sequences#index' ,       :via => :get
  match ':gameName/experiments/create',        :to => 'experiments#create',       :via => :get  # show the form for creating experiments
  match ':gameName/experiments/created',       :to => 'experiments#created',      :via => :post  # receives and creates new experiments
  match ':gameName/experiments/show',          :to => 'experiments#show',         :via => :get   # show existing sequences
  match ':gameName/experiments/update',          :to => 'experiments#update',      :via => :post   # receive and update sequences
  match ':gameName/experiments/xml/:experimentName',             :to => 'experiments#xml',          :via => :get   # show existing experiments
  match ':gameName/experiments/delete',                     :to => 'experiments#delete',      :via => :post
  match ':gameName/experiments/updated',                      :to => 'experiments#updated',     :via => :post
  
  
  
  match ':gameName/experiments/:experimentName',            :to => 'experiments#ShowSequenceRandomXml', :via => :get
  
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
