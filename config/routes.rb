Rails.application.routes.draw do
  resources :entries do
    get 'archive', on: :collection
  end
  resources :weeks
  root 'entries#index'
  get 'reports', to: 'reports#index'
end
