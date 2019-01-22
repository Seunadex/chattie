# == Route Map
#
#                       Prefix Verb   URI Pattern                                                                              Controller#Action
#             new_user_session GET    /users/sign_in(.:format)                                                                 sessions#new
#                 user_session POST   /users/sign_in(.:format)                                                                 sessions#create
#         destroy_user_session DELETE /users/sign_out(.:format)                                                                sessions#destroy
#            new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#           edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                              PUT    /users/password(.:format)                                                                devise/passwords#update
#                              POST   /users/password(.:format)                                                                devise/passwords#create
#     cancel_user_registration GET    /users/cancel(.:format)                                                                  registrations#cancel
#        new_user_registration GET    /users/sign_up(.:format)                                                                 registrations#new
#       edit_user_registration GET    /users/edit(.:format)                                                                    registrations#edit
#            user_registration PATCH  /users(.:format)                                                                         registrations#update
#                              PUT    /users(.:format)                                                                         registrations#update
#                              DELETE /users(.:format)                                                                         registrations#destroy
#                              POST   /users(.:format)                                                                         registrations#create
#                              PUT    /chatrooms/:id(.:format)                                                                 chatrooms#update_topic
#                              POST   /chatrooms/:id(.:format)                                                                 chatrooms#update_purpose
#                              POST   /direct_messages/:id(.:format)                                                           direct_messages#update_purpose
#                              PUT    /direct_messages/:id(.:format)                                                           direct_messages#update_topic
#                              PUT    /chatrooms/:chatroom_id/messages/:id(.:format)                                           messages#pin_message
#                              GET    /chatrooms/:chatroom_id/messages(.:format)                                               messages#get_pinned_messages
#  new_chatroom_chatroom_users GET    /chatrooms/:chatroom_id/chatroom_users/new(.:format)                                     chatroom_users#new
# edit_chatroom_chatroom_users GET    /chatrooms/:chatroom_id/chatroom_users/edit(.:format)                                    chatroom_users#edit
#      chatroom_chatroom_users GET    /chatrooms/:chatroom_id/chatroom_users(.:format)                                         chatroom_users#show
#                              PATCH  /chatrooms/:chatroom_id/chatroom_users(.:format)                                         chatroom_users#update
#                              PUT    /chatrooms/:chatroom_id/chatroom_users(.:format)                                         chatroom_users#update
#                              DELETE /chatrooms/:chatroom_id/chatroom_users(.:format)                                         chatroom_users#destroy
#                              POST   /chatrooms/:chatroom_id/chatroom_users(.:format)                                         chatroom_users#create
#            chatroom_messages GET    /chatrooms/:chatroom_id/messages(.:format)                                               messages#index
#                              POST   /chatrooms/:chatroom_id/messages(.:format)                                               messages#create
#         new_chatroom_message GET    /chatrooms/:chatroom_id/messages/new(.:format)                                           messages#new
#        edit_chatroom_message GET    /chatrooms/:chatroom_id/messages/:id/edit(.:format)                                      messages#edit
#             chatroom_message GET    /chatrooms/:chatroom_id/messages/:id(.:format)                                           messages#show
#                              PATCH  /chatrooms/:chatroom_id/messages/:id(.:format)                                           messages#update
#                              PUT    /chatrooms/:chatroom_id/messages/:id(.:format)                                           messages#update
#                              DELETE /chatrooms/:chatroom_id/messages/:id(.:format)                                           messages#destroy
#                    chatrooms GET    /chatrooms(.:format)                                                                     chatrooms#index
#                              POST   /chatrooms(.:format)                                                                     chatrooms#create
#                 new_chatroom GET    /chatrooms/new(.:format)                                                                 chatrooms#new
#                edit_chatroom GET    /chatrooms/:id/edit(.:format)                                                            chatrooms#edit
#                     chatroom GET    /chatrooms/:id(.:format)                                                                 chatrooms#show
#                              PATCH  /chatrooms/:id(.:format)                                                                 chatrooms#update
#                              PUT    /chatrooms/:id(.:format)                                                                 chatrooms#update
#                              DELETE /chatrooms/:id(.:format)                                                                 chatrooms#destroy
#              direct_messages GET    /direct_messages(.:format)                                                               direct_messages#index
#                              POST   /direct_messages(.:format)                                                               direct_messages#create
#           new_direct_message GET    /direct_messages/new(.:format)                                                           direct_messages#new
#          edit_direct_message GET    /direct_messages/:id/edit(.:format)                                                      direct_messages#edit
#               direct_message GET    /direct_messages/:id(.:format)                                                           direct_messages#show
#                              PATCH  /direct_messages/:id(.:format)                                                           direct_messages#update
#                              PUT    /direct_messages/:id(.:format)                                                           direct_messages#update
#                              DELETE /direct_messages/:id(.:format)                                                           direct_messages#destroy
#                         root GET    /                                                                                        chatrooms#index
#                                     /cable                                                                                   #<ActionCable::Server::Base:0x00007f8c6b1b8a60 @mutex=#<Monitor:0x00007f8c6b1b8a10 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Thread::Mutex:0x00007f8c6b1abcc0>>, @pubsub=nil, @worker_pool=nil, @event_loop=nil, @remote_connections=nil>
#           rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#    rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#           rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#    update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#         rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions'}
  put "/chatrooms/:id" => "chatrooms#update_topic"
  post "/chatrooms/:id" => "chatrooms#update_purpose"
  post "/direct_messages/:id" => "direct_messages#update_purpose"
  put "/direct_messages/:id" => "direct_messages#update_topic"
  put "/chatrooms/:chatroom_id/messages/:id" => "messages#pin_message"
  get "chatrooms/:chatroom_id/messages" => "messages#get_pinned_messages"

  resources :chatrooms do
    resource :chatroom_users, only: [:create, :destroy]
    resources :messages, only: [:show, :create]
  end
  resources :direct_messages, only: :show

  root to: "chatrooms#index"
  # get 'homepage' => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  mount ActionCable.server => '/cable'
  # mount ActionCable.server, at: '/cable'
end
