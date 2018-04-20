class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    unless message.body == ""
      if message.save
        MessageRelayJob.perform_later(message)
      end
    end
  end

  def pin_message
    message = @chatroom.messages.find(params[:id])
    if message.pinned
      message.update_attributes(pinned: false, pinned_by: nil)
    else
      message.update_attributes(pinned: true, pinned_by: current_user.username)
    end
  end

  def show; end

  def get_pinned_messages
    @data = Message.pinned?(@chatroom.id)
    respond_to do |format|
      format.json { render json: @data }
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.get_chatroom(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
