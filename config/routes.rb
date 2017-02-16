Rails.application.routes.draw do
  resources :appointments, except: :destroy
end
