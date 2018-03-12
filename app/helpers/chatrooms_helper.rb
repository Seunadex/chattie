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
      "<button class='purpose-btn' data-toggle='modal' data-target='#exampleModal'>
       </i> #{@chatroom_purpose} </button>".html_safe
    elsif direct_message(@chatroom.id)
      'Direct Conversation'
    else
      "<button class='purpose-btn' data-toggle='modal' data-target='#exampleModal' >
        <i class='fa fa-pencil'> </i>Add a purpose
      </button>".html_safe
    end
  end
end
