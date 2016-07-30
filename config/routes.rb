Rails.application.routes.draw do
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications', to: 'notifications#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :memories do
    resources :comments
  end
  root 'memories#index'
end
