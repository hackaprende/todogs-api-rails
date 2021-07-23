Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        delete "log_out", to: "sessions#destroy"
      end

      resources :dogs, only: [:index] 
      get "get_user", to: "users#get_user"
    end
  end
end
