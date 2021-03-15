# frozen_string_literal: true

class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    @chatroom_user ||= @chatroom.chatroom_users.create(user_id: current_user.id)
    redirect_to @chatroom
  end

  def destroy
    @chatroom_user.destroy
    redirect_to chatrooms_path
  end

  private

  def set_chatroom_user
    @chatroom_user = ChatroomUser.find_by(user_id: current_user.id)
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
