Citistats::Application.routes.draw do
  root to: 'stations#index'
  
  resources :stations, only: [:index] do
    resources :snapshots, controller: 'station_snapshots', only: [:index]
  end
end
