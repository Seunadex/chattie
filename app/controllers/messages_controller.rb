class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user

    if message.save
      redirect_to @chatroom
    end
  end

  def show
    
  end

  private
  def set_chatroom
    @chatroom = Chatroom.get_chatroom(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
