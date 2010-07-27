ActionController::Routing::Routes.draw do |map|

  # User/Account
  map.resource :user_session
  map.resource :account, :controller => 'users'
  map.resources :users

  # Programs
  map.resources :programs do |program|
    program.resources :workout_blocks, :only => [:index, :new]
  end

  # Workout Blocks
  map.resources :workout_blocks, :except => [:index, :new] do |workout_block|
    workout_block.resources :workout_plans, :only => [:index, :new]
  end

  # Workout Plans
  map.resources :workout_plans, :except => [:index, :new] do |workout_plan|
    workout_plan.resources :exercise_plans, :only => [:index]
    workout_plan.resources :strength_plans, :only => [:new]
    workout_plan.resources :single_plans, :only => [:new]
    workout_plan.resources :cardio_plans, :only => [:new]
  end

  # Exercise Plans
  map.resources :exercise_plans, :only => [:index, :show]

  # Strength Plans
  map.resources :strength_plans, :except => [:index, :new] do |strength_plan|
    #strength_plan.resources :strength_plan_sets, :only => [:index, :new]
  end

  # Single Plans
  map.resources :single_plans, :except => [:index, :new] do |single_plan|
    single_plan.resources :single_plan_sets, :only => [:index, :new]
  end

  map.resources :measurements
  map.resources :cardio_plans, :except => [:index, :new]
  map.resources :single_plan_sets, :except => [:index, :new]
  map.resources :exercises
  map.resources :dashboards, :only => [:index]
  map.resources :analyzes, :only => [:index]

  map.root :controller => 'landing',
           :action => 'index'



  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
