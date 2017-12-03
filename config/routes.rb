Rails.application.routes.draw do
  root 'welcome#index'

  resources :trains do
    resources :carriages
  end
  resources :railway_stations do
    patch :update_attrs, on: :member
  end
  resources :routes
end
