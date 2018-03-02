Rails.application.routes.draw do
  devise_for :users

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "chatrooms#index"

  mount ActionCable.server => '/cable'
end
