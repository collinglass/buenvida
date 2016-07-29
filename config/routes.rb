Rails.application.routes.draw do
  resources :memories
  root 'memories#index'
end
