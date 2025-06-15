Rails.application.routes.draw do
  get "home/index"
  # API Versioning
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Vehicles
      resources :vehicles, param: :veh_plate, except: [:new, :edit] do
        collection do
          get :search
          get :stats
          get 'by_plate/:plate', to: 'vehicles#by_plate'
        end
      end

      # Cameras
      resources :cameras, except: [:new, :edit] do
        member do
          patch :toggle_status
          post :calibrate
        end
        collection do
          get :active
        end
      end

      # Zone_Types
      resources :zone_types, except: [:new, :edit]
      # Zones
      resources :zones, except: [:new, :edit] do
        resources :roads, only: [:index]
        member do
          get :traffic_patterns
        end
      end

      # Road type
      resources :road_types, except: [:new, :edit]
      # Roads
      resources :roads, except: [:new, :edit] do
        resources :cameras, only: [:index, :create]
        member do
          get :traffic_data
          get :average_speed
        end
      end

      # Monitorings
      resources :monitorings, only: [:index, :show, :create, :update, :destroy] do
        collection do
          get :recent
          get 'by_vehicle/:vehicle_plate', to: 'monitorings#by_vehicle'
          get 'by_camera/:camera_id', to: 'monitorings#by_camera'
          get 'by_date/:date', to: 'monitorings#by_date'
        end
      end
    end

    # API Documentation
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'
  end

  # Health Checks
  get :health, to: 'health#check'
  get :readiness, to: 'health#readiness'
  get :liveness, to: 'health#liveness'

  # Error Handling
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#server_error', via: :all

  # Root Route
  root 'home#index'
end