Rails.application.routes.draw do
  devise_for :users
  root "health_entries#index"
  resources :health_entries do
    collection do
      get :export
    end
  end
  namespace :api do
    namespace :v1 do
      resources :health_entries, only: [:index]
    end
  end
end
