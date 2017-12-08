Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resources :eventful_places
    resources :eventful_events
  end

  resources :eventful_places, only: :index
end
