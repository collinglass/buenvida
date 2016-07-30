Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :memories do
    resources :comments
  end
  root 'memories#index'
end
