Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        delete "log_out", to: "sessions#destroy"
      end

      resources :dogs
      post "create_dog", to: "dogs#create"
      get "get_user", to: "users#get_user"
      post "add_dog_to_user", to: "users#add_dog_to_user"
      post "remove_dog_for_user", to: "users#remove_dog_for_user"
      get "get_user_dogs", to: "users#get_user_dogs"
      get "find_dog_by_ml_id", to: "dogs#get_dog_by_ml_id"
    end
  end
end
