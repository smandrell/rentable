Rails.application.routes.draw do
  root 'properties#index'
  resources :properties do
    resources :units
  end
end
