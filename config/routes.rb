Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'registrations'}
  put "/chatrooms/:id" => "chatrooms#update_topic"
  post "/chatrooms/:id" => "chatrooms#update_purpose"
  post "/direct_messages/:id" => "direct_messages#update_purpose"
  put "/direct_messages/:id" => "direct_messages#update_topic"
  put "/chatrooms/:chatroom_id/messages/:id" => "messages#pin_message"
  get "chatrooms/:chatroom_id/messages" => "messages#get_pinned_messages"

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :direct_messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "chatrooms#index"

  # mount ActionCable.server => '/cable'
  # mount ActionCable.server, at: '/cable'
end
