Rails.application.routes.draw do
  resources :books #, only: [:show]
  root 'pages#home'
  get 'about', to: 'pages#about'
end
