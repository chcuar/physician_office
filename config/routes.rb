Rails.application.routes.draw do

  root 'physicians#index'

  resources :patients

  resources :physicians do
    resources :appointments
  end
  
end
