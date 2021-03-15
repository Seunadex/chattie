# frozen_string_literal: true

class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}",
                                 message: render_message(message),
                                 chatroom_id: message.chatroom.id,
                                 username: message.user_username,
                                 body: message.body,
                                 created_at: message.created_at
  end

  private

  def render_message(message)
    MessagesController.render(partial: "message", locals: { message: message })
  end
end
