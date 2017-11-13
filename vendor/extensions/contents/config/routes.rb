Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :contents do
    get '/data' => 'contents#data'
    resources :contents, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :contents, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :contents, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
