Rails.application.routes.draw do
  resources :appointments, except: :destroy
  resources :users
end
