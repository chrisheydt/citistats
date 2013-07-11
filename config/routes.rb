Citistats::Application.routes.draw do
  resources :stations, only: [:index] do
    resources :snapshots, controller: 'station_snapshots', only: [:index]
  end
end
