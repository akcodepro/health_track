Rails.application.routes.draw do
  devise_for :users
  root "health_entries#index"
  resources :health_entries
end
