Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  # temp routes to avoid cross-origin-access-control header in web app
  get '/v1/states', to: "api/v1/states#index"
  get '/v1/states/:state_id/districts', to: "api/v1/states#districts"

  constraints :subdomain => "api" do
    scope :module => "api", :as => "api" do
      namespace :v1 do
        resources :states
        resources :districts
        post '/reps/address', action: :address, controller: 'reps'
        post '/reps/coordinates', action: :coordinates, controller: 'reps'
      end
    end
  end

  # For the single page app
  get '*path', to: 'pages#home'
end
