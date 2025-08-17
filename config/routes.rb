Rails.application.routes.draw do
  get "brags/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


# Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
# get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
# get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
# Defines the root path route ("/")
root "tasks#index"
get "/tasks", to: "tasks#index", as: :tasks
post "/tasks",     to: "tasks#create", as: :create_task
delete "/tasks/:id", to: "tasks#destroy", as: :delete_task
patch "/tasks/:id", to: "tasks#update", as: :update_task

get "brags", to: "brags#index", as: :brags
end
