module ChatroomsHelper
  def check_message(message)
    @chatroom_user.last_read_at < message.created_at
  end

  def get_other_users
    @users.reject { |user| user == current_user }
  end

  def reciever_info
    show_members(@chatroom.id).reject { |u| u.user == current_user }
  end

  def show_public_channels(current_user)
    current_user.chatrooms.where("direct_message = ?", false)
  end

  def show_user_count(chatroom_id)
    show_members(chatroom_id).size
  end

  def show_members(chatroom_id)
    ChatroomUser.member?(chatroom_id)
  end

  def check_member(chatroom_id, user_id)
    ChatroomUser.has_joined?(chatroom_id, user_id).present?
  end

  def channel_details(chatroom_id)
    Chatroom.check_dm(chatroom_id) ? "this conversation" : @chatroom.name.to_s
  end

  def pinned_message_length(chatroom_id)
    Message.pinned?(chatroom_id).size
  end
end
