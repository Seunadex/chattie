module ChatroomsHelper
  def check_message(message)
    @chatroom_user.last_read_at < message.created_at
  end

  def get_other_users
    @users - [current_user]
  end

  def direct_message(id)
    Chatroom.find(id).direct_message
  end

  def check_purpose
    if @chatroom_purpose && !direct_message(@chatroom.id)
      "<button class='purpose-btn' data-toggle='modal'
      data-target='#exampleModal'>
       </i> #{@chatroom_purpose} </button>".html_safe
    elsif direct_message(@chatroom.id) && @chatroom_purpose.nil?
      "Direct Conversation"
    else
      "<button class='purpose-btn' data-toggle='modal'
      data-target='#exampleModal' >
        <i class='fa fa-pencil'> </i>Add a purpose
      </button>".html_safe
    end
  end

  def show_public_channels(current_user)
    current_user.chatrooms.where("direct_message = ?", false)
  end

  def show_user_count(chatroom_id)
    ChatroomUser.member?(chatroom_id).count
  end

  def show_members(chatroom_id)
    ChatroomUser.member?(chatroom_id).pluck(:username)
  end

  def publicly_accessible?(chatroom_id)
    if Chatroom.get_chatroom_access(chatroom_id) == "public"
      "hashtag bullet"
    else
      "lock bullet"
    end
  end

  def check_member(chatroom_id)
    !ChatroomUser.member?(chatroom_id).empty?
  end

  def channel_details
    if Chatroom.check_dm(@chatroom.id)
      'this conversation'
    else
      "#{@chatroom.name}"
    end
  end
end
