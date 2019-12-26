class DirectMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users

  def show
    users = User.where(id: [current_user.id, params[:id]])
    @chatroom = Chatroom.direct_message_for_users(users)
    @messages = @chatroom.messages.
                includes(:user).
                order(created_at: :desc).
                reverse
    @chatroom_user = ChatroomUser.find_by(
      chatroom_id: @chatroom.id,
      user_id: current_user.id
    )
    render "chatrooms/show"
  end

  private

  def set_users
    @users = User.all
  end
end
