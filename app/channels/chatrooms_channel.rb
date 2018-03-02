class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    current_user.chatrooms.each do |chatroom|
      stream_from "chatrooms:#{chatroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    @chatroom = Chatroom.get_chatroom(data["chatroom_id"])
    message = @chatroom.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
