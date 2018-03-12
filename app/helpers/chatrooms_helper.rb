module ChatroomsHelper
  def check_message(message)
    @chatroom_user.last_read_at < message.created_at
  end

  def get_other_users
    @users - [current_user]
  end

  def check_purpose
    if @chatroom_purpose
      "<button class='purpose-btn' data-toggle='modal' data-target='#exampleModal'>
       </i> #{@chatroom_purpose} </button>".html_safe
    else
      "<button class='purpose-btn' data-toggle='modal' data-target='#exampleModal' >
        <i class='fa fa-pencil'> </i>Add a purpose
      </button>".html_safe
    end
  end
end
