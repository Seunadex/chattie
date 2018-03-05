class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}",
                                 username: message.user.username,
                                 body: message.body,
                                 created_at: message.created_at,
                                 chatroom_id: message.chatroom.id
  end
end
