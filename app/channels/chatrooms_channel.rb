# frozen_string_literal: true

class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "chatrooms:#{chatroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    @chatroom = Chatroom.find(data["chatroom_id"])
    message = @chatroom.messages.create(body: data["body"], user: current_user)
  end
end
