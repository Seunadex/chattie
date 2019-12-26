module ChatroomsHelper
  def check_message(message)
    @chatroom_user.last_read_at < message.created_at
  end

  def other_users
    @users.reject { |user| user == current_user }
  end

  def reciever_info
    @chatroom.members.reject { |u| u.user == current_user }
  end
end
