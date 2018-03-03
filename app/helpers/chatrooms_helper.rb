module ChatroomsHelper
  def check_message(message)
    @chatroom_user.last_read_at > message.created_at
  end
end
